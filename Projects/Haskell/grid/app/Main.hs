-- {-# LANGUAGE InstanceSigs #-}
-- {-# LANGUAGE FlexibleInstances #-}
-- {-# LANGUAGE TypeSynonymInstances #-}
module Main where

import Graphics.Rendering.OpenGL as GL
import Graphics.UI.GLFW as GLFW
import Control.Monad (forever)
import System.Exit (exitSuccess)
import Foreign.Marshal.Array (withArray)
import Foreign.Ptr (plusPtr, nullPtr, Ptr)
import Foreign.Storable (sizeOf)
import LoadShaders
import Graphics.GLUtil (readTexture, texture2DWrap)
import Text.Printf

type Vec2 = (Double, Double)
type Vec3 = (Double, Double, Double)

data Vec = Vec2 
         | Vec3

gridIDX :: (Num a, Enum a) => a -> a -> [[a]]
gridIDX m n = [[m * r .. m * r + m - 1] | r <- [0 .. n - 1]]

gridP :: (Integral a) => Int -> a -> [[Vec2]]
gridP    m n = toVec2 $ fuseLists (gridRows m n) (gridCols m n)

gridCols :: (Num t, Enum t) => Int -> t -> [[t]]
gridCols m n = replicate m [0 .. n - 1]                

gridRows :: (Num a, Enum a) => Int -> a -> [[a]]
gridRows m n = [take m (repeat r) | r <- [0 .. n - 1]]

gridCd :: Vec3 -> Int -> Int -> [[Vec3]]
gridCd clr m n = replicate m $ replicate n clr

gridUV :: Integral a => Int -> a -> [[Vec2]]
gridUV   m n = mathGrid (*(1/(fromIntegral m-1.0))) $ gridP m n

toVec2 :: (Integral a) => [[(a, a)]] -> [[Vec2]]
toVec2 grid = [map (mapT fromIntegral) x | x <- grid]

-- class Doubles a where
--   toDoubles :: a -> [Double]
-- instance Doubles Vec2 where
--   toDoubles :: Vec2 -> [Double]
--   toDoubles (x ,y) = [x, y]
-- instance Doubles Vec3 where
--   toDoubles :: Vec3 -> [Double]
--   toDoubles (x ,y, z) = [x, y, z]
-- instance Doubles [Vec2] where
--   toDoubles :: [Vec2] -> [Double]
--   toDoubles x = undefined
  

mathGrid :: (Double -> Double) -> [[Vec2]] -> [[Vec2]]
mathGrid f g = [map (mapT f) x | x <- g]

fuseLists :: [[a]] -> [[b]] -> [[(a, b)]]
fuseLists (x:xs) (y:ys) = (zip x y) : (fuseLists xs ys)
fuseLists [] _ = []
fuseLists _ [] = []

fuseGrids :: t2 -> t1 -> t -> [(Vec3, Vec3, Vec2)]
fuseGrids pos cd uv =
               zip3 (map (toVec3 0.0) $ concat $ gridP 3 3)
                    (concat $ gridCd (0.0, 0.0, 0.0) 3 3)
                    (concat $ gridUV 3 3)

concatGrids :: [(Vec3, Vec3, Vec2)] -> [Double]
concatGrids fg = concat $ map concatGrids' fg
concatGrids' :: ((t, t, t), (t, t, t), (t, t)) -> [t]
concatGrids' (pos, cd, uv) = ( (\(x,y,z) (r,g,b) (u,v) -> [x,y,z,r,g,b,u,v]) pos cd uv )

mapT :: (t1 -> t) -> (t1, t1) -> (t, t)
mapT f (a1, a2) = (f a1, f a2)

-- | [Vec2] -> [Vec3]
toVec3 :: Double -> Vec2 -> Vec3
toVec3 z (x,y) = (x, y, z)

faceVerts i j m n =                  -- face vertices indexes
  [tl, tr, bl, br]
  where
    tl = (gridIDX m n)!!i!!j         -- Top Left
    tr = (gridIDX m n)!!i!!(j+1)     -- Top Right
    bl = (gridIDX m n)!!(i+1)!!j     -- Bottom Right
    br = (gridIDX m n)!!(i+1)!!(j+1) -- Bottom Right

data Descriptor =
     Descriptor VertexArrayObject NumArrayIndices

data GLMatrix a =
     GLMatrix !a !a !a !a
              !a !a !a !a
              !a !a !a !a
              !a !a !a !a
                deriving Eq

instance PrintfArg a => Show (GLMatrix a) where
  show (GLMatrix m11 m12 m13 m14
                 m21 m22 m23 m24
                 m31 m32 m33 m34
                 m41 m42 m43 m44) =
    let matrix = "[ %v %v %v %v ]\n\
                 \[ %v %v %v %v ]\n\
                 \[ %v %v %v %v ]\n\
                 \[ %v %v %v %v ]\n"
    in printf matrix m11 m12 m13 m14
                     m21 m22 m23 m24
                     m31 m32 m33 m34
                     m41 m42 m43 m44

verticies :: [GLfloat]
verticies =
  [ -- | positions    -- | colors      -- | uv
    0.5,  0.5, 0.0,   1.0, 0.0, 0.0,   1.0, 1.0,
    0.5, -0.5, 0.0,   0.0, 1.0, 0.0,   1.0, 0.0,
   -0.5, -0.5, 0.0,   0.0, 0.0, 1.0,   0.0, 0.0,
   -0.5,  0.5, 0.0,   0.0, 0.0, 0.0,   0.0, 1.0
  ]

indices :: [GLuint]
indices =
  [          -- Note that we start from 0!
    0, 1, 3, -- First Triangle
    1, 2, 3  -- Second Triangle
  ]
     
keyPressed :: GLFW.KeyCallback 
keyPressed win GLFW.Key'Escape _ GLFW.KeyState'Pressed _ = shutdown win
keyPressed _   _               _ _                     _ = return ()
                                                                  
shutdown :: GLFW.WindowCloseCallback
shutdown win =
  do
    GLFW.destroyWindow win
    GLFW.terminate
    _ <- exitSuccess
    return ()                                                                  
     
resizeWindow :: GLFW.WindowSizeCallback
resizeWindow _ w h =
  do
    GL.viewport   $= (GL.Position 0 0, GL.Size (fromIntegral w) (fromIntegral h))
    GL.matrixMode $= GL.Projection
    GL.loadIdentity
    GL.ortho2D 0 (realToFrac w) (realToFrac h) 0   

openWindow :: String -> (Int, Int) -> IO GLFW.Window
openWindow title (sizex,sizey) =
  do
    GLFW.init
    GLFW.defaultWindowHints
    GLFW.windowHint (GLFW.WindowHint'ContextVersionMajor 4)
    GLFW.windowHint (GLFW.WindowHint'ContextVersionMinor 5)
    GLFW.windowHint (GLFW.WindowHint'OpenGLProfile GLFW.OpenGLProfile'Core)
    GLFW.windowHint (GLFW.WindowHint'Resizable False)
    Just win <- GLFW.createWindow sizex sizey title Nothing Nothing
    GLFW.makeContextCurrent (Just win)
    GLFW.setWindowSizeCallback win (Just resizeWindow)
    GLFW.setKeyCallback win (Just keyPressed)
    GLFW.setWindowCloseCallback win (Just shutdown)
    return win

closeWindow :: GLFW.Window -> IO ()
closeWindow win =
  do
    GLFW.destroyWindow win
    GLFW.terminate

display :: IO ()
display =
  do
    inWindow <- openWindow "NGL is Not GLoss" (512,512)
    descriptor <- initResources verticies indices
    onDisplay inWindow descriptor
    closeWindow inWindow
                 
onDisplay :: GLFW.Window -> Descriptor -> IO ()
onDisplay win descriptor@(Descriptor triangles numIndices) =
  do
    GL.clearColor $= Color4 0 0 0 1
    GL.clear [ColorBuffer]
    bindVertexArrayObject $= Just triangles
    drawElements Triangles numIndices GL.UnsignedInt nullPtr
    GLFW.swapBuffers win
   
    forever $ do
       GLFW.pollEvents
       onDisplay win descriptor                 

-- | Init resources
---------------------------------------------------------------------------
initResources :: [GLfloat] -> [GLuint] -> IO Descriptor
initResources vs idx =
  do
    -- | VAO
    triangles <- genObjectName
    bindVertexArrayObject $= Just triangles

    -- | VBO
    vertexBuffer <- genObjectName
    bindBuffer ArrayBuffer $= Just vertexBuffer
    let numVertices = length verticies
    withArray verticies $ \ptr ->
      do
        let sizev = fromIntegral (numVertices * sizeOf (head verticies))
        bufferData ArrayBuffer $= (sizev, ptr, StaticDraw)

    -- | EBO
    elementBuffer <- genObjectName
    bindBuffer ElementArrayBuffer $= Just elementBuffer
    let numIndices = length indices
    withArray idx $ \ptr ->
      do
        let indicesSize = fromIntegral (numIndices * (length indices))
        bufferData ElementArrayBuffer $= (indicesSize, ptr, StaticDraw)

    -- | Bind the pointer to the vertex attribute data
    let floatSize  = (fromIntegral $ sizeOf (0.0::GLfloat)) :: GLsizei
        stride     = 8 * floatSize

    -- | Positions
    let vPosition  = AttribLocation 0
        posOffset  = 0 * floatSize
    vertexAttribPointer vPosition $=
        (ToFloat, VertexArrayDescriptor 3 Float stride (bufferOffset posOffset))
    vertexAttribArray vPosition   $= Enabled

    -- | Colors
    let vColor  = AttribLocation 1
        clrOffset  = 3 * floatSize
    vertexAttribPointer vColor $=
        (ToFloat, VertexArrayDescriptor 3 Float stride (bufferOffset clrOffset))
    vertexAttribArray vColor   $= Enabled

    -- | UV
    let uvCoords   = AttribLocation 2
        uvOffset   = 6 * floatSize
    vertexAttribPointer uvCoords  $=
        (ToFloat, VertexArrayDescriptor 2 Float stride (bufferOffset uvOffset))
    vertexAttribArray uvCoords    $= Enabled


    -- | Assign Textures
    activeTexture            $= TextureUnit 0
    let tex_00 = "Resources/Textures/container.jpg"
    tx0 <- loadTex tex_00
    texture Texture2D        $= Enabled
    textureBinding Texture2D $= Just tx0
    
    activeTexture            $= TextureUnit 1
    let tex_01 = "Resources/Textures/awesomeface.png"
    tx1 <- loadTex tex_01
    textureBinding Texture2D $= Just tx1
    texture Texture2D        $= Enabled
    
    -- || Shaders
    program <- loadShaders [
        ShaderInfo VertexShader   (FileSource "Shaders/shader.vert"),
        ShaderInfo FragmentShader (FileSource "Shaders/shader.frag")]
    currentProgram $= Just program

    -- Set Uniforms
    location0 <- get (uniformLocation program "tex_00")
    uniform location0 $= (TextureUnit 0)
    location1 <- get (uniformLocation program "tex_01")
    uniform location1 $= (TextureUnit 1)

    -- Set Transform Matrix
    let tr =
          [ 1, 0, 0, 0
          , 0, 1, 0, 0
          , 0, 0, 1, 0
          , 0, 0, 0, 0.5 ] :: [GLfloat]
          
    transform <- GL.newMatrix ColumnMajor tr :: IO (GLmatrix GLfloat)
    location2 <- get (uniformLocation program "transform")
    uniform location2 $= (transform)
    
    -- || Unload buffers
    bindVertexArrayObject         $= Nothing
    -- bindBuffer ElementArrayBuffer $= Nothing

    return $ Descriptor triangles (fromIntegral numIndices)

bufferOffset :: Integral a => a -> Ptr b
bufferOffset = plusPtr nullPtr . fromIntegral

loadTex :: FilePath -> IO TextureObject
loadTex f =
  do
    t <- either error id <$> readTexture f
    textureFilter Texture2D $= ((Linear', Nothing), Linear')
    texture2DWrap $= (Repeated, ClampToEdge)
    return t
---------------------------------------------------------------------------

main :: IO ()
main =
  do
    display
