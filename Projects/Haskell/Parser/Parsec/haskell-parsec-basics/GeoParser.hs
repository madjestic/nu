{-# LANGUAGE FlexibleContexts #-}
module GeoParserTrifecta where

import qualified Text.Parsec as P
import qualified Data.ByteString.Lazy.Char8 as BC       
import Control.Applicative
import Control.Monad.Identity (Identity)
import qualified Data.ByteString.Lazy as B       

data Geo = 
     Geo
       { fileversion :: String
       , hasindex    :: String 
       } deriving Show

data Info =
     Info 
       { software    :: String
       -- , hostname    :: String
       -- , artist      :: String
       -- , timetocook  :: String
       -- , date        :: String
       -- , time        :: String
       -- , bounds      :: String
       -- , prim_sum    :: String
       -- , attr_sum    :: String 
       } deriving Show

jsonFile :: FilePath
jsonFile = "model.geo"            

getJson :: IO B.ByteString
getJson = B.readFile jsonFile          

-- | Converts (Parser String) type to String
toString :: Either P.ParseError [Char] -> [Char]
toString (Right x) = x
toString (Left  e) = show e

-- | Converts String to (Parser String) type
toRight :: [String] -> Either P.ParseError [String]
toRight x = (Right x)
        
parse rule text = 
  do
    let foo = P.parse rule "source" text
    return foo

getText :: IO [Char]
getText = 
  do
    textJson <- getJson
    let text = BC.unpack textJson -- here file gets read as a bytesting and byte8 representation is converted into [Char]
    return text

dot :: P.Parsec String () ()  
dot =
  do
    P.char '.'
    return ()

comma :: P.Parsec String () ()
comma = 
  do
    P.spaces
    P.char ','
    P.spaces
    return ()
  
slash :: P.Parsec String () ()
slash = 
  do
    P.char '\"'
    return ()

newline :: P.Parsec String () ()  
newline =
  do
    P.char '\n'
    return ()

semicol :: P.Parsec String () ()  
semicol =
  do
    P.char ':'
    return ()

matchString :: P.Stream s m Char => String -> P.ParsecT s u m ()
matchString a =
  do
    P.manyTill P.anyChar (P.string a)
    return ()
  

fileVersion :: P.ParsecT String () Identity ([Char])
fileVersion =
  do
    matchString "fileversion" >> slash >> comma >> slash
    majorVer <- P.many1 P.digit
    dot
    minorVer <- P.many1 P.digit
    dot
    buildVer <- P.many1 P.digit
    let result = majorVer ++ "." ++ minorVer ++ "." ++ buildVer
    return result

hasIndex :: P.ParsecT String () Identity [Char]
hasIndex = 
  do
    matchString "hasindex" >> slash >> comma
    indexVal <- P.many1 P.letter
    return (indexVal)

pointCount :: P.ParsecT String () Identity [Char]
pointCount = 
  do
    matchString "pointcount" >> slash >> comma
    pointcount <- P.many1 P.digit
    return (pointcount)

vertexCount :: P.ParsecT String () Identity [Char]
vertexCount = 
  do
    P.try (matchString "vertexcount") <|> (matchString "fileversion" >> matchString "vertexcount")
    slash >> comma
    vertexcount <- P.many1 P.digit
    return (vertexcount)
  
primitiveCount :: P.ParsecT String () Identity [Char]
primitiveCount = 
  do
    P.try (matchString "primitivecount") <|> (matchString "pointcount" >> matchString "primitivecount") >> slash >> comma
    pointcount <- P.many1 P.digit
    return (pointcount)

infoVal =
  do
    fileVersion >> hasIndex >> pointCount >> vertexCount >> primitiveCount
    matchString "info"
  
    matchString "software" >> slash >> semicol >> slash
    software <- P.many1 P.letter
    P.spaces
    majorVer <- P.many1 P.digit
    dot
    minorVer <- P.many1 P.digit
    dot
    buildVer <- P.many1 P.digit
    let formatted = software ++ " " ++ majorVer ++ "." ++ minorVer ++ "." ++ buildVer
  
    let result = ( Info formatted )
    return (result)  

-- | I should probably parse it on one go, populating a respective
-- | data structure with relevant data.
geoParser = 
  do
    matchString "fileversion" >> slash >> comma >> slash
    majorVer <- P.many1 P.digit
    dot
    minorVer <- P.many1 P.digit
    dot
    buildVer <- P.many1 P.digit
    let fileversion = majorVer ++ "." ++ minorVer ++ "." ++ buildVer

    matchString "hasindex" >> slash >> comma
    index <- P.many1 P.letter

    return ( Geo fileversion index )

main :: IO ()
main = 
  do
    text <- getText
    let text1 = lines text
    mapM_ print text1

    fileversion    <- parse (fileVersion)    text
    index          <- parse (hasIndex)       text
    pointcount     <- parse (pointCount)     text
    vertexcount    <- parse (vertexCount)    text
    primitivecount <- parse (primitiveCount) text
    info           <- parse (infoVal)        text

    putStrLn $ toString fileversion
    putStrLn $ toString index
    putStrLn $ toString pointcount
    putStrLn $ toString vertexcount
    putStrLn $ toString primitivecount
    print $ info


