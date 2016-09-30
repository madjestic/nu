{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
module GeoParser where

import qualified Text.Parsec as P
import qualified Data.ByteString.Lazy.Char8 as BC       
import Control.Applicative
import Control.Monad.Identity (Identity)
import Control.Monad (mzero)
import Data.Aeson
import qualified Data.ByteString.Lazy as B
import Data.Text (Text)

data Geo = 
     Geo
       { fileversion :: String 
       , pointcount  :: String 
       , hasindex    :: String 
       , vertexcount :: String 
       , primcount   :: String 
       , info        :: Info
       , topolology  :: String
       } deriving    Show            
                     
data Info =          
     Info            
       { software    :: String            
       , hostname    :: String            
       , artist      :: String            
       , date        :: String            
       , time        :: String            
       , bounds      :: [Double]          
       , primsum     :: (Integer, String) 
       , attrsum     :: String 
       } deriving Show

-- data Topology =
--      Topology
--        { indeces     :: [Integer] }

data Attributes =                       
     Attributes
       { vertexattributes :: ()
       , pointattributes  :: ()
       }

data Person =
  Person { firstName :: !Text
         , lastName  :: !Text
         , age       :: Int
         , likesPizza:: Bool
         } deriving Show

instance FromJSON Person where
  parseJSON (Object v) =
    Person <$> v     .: "firstName"
           <*> v     .: "lastName"   
           <*> v     .: "age"        
           <*> v     .: "likesPizza" 
  parseJSON _ = mzero

csv :: P.Parsec String () ()
csv = 
  do
    P.endBy line closedScBr
    return ()

line :: P.Parsec String () ()
line = 
  do
    P.sepBy cell (P.char ',')
    return ()

tab :: P.Parsec String () ()
tab = 
  do
    matchString "\\t"
    return ()

cell :: P.Parsec String () ()
cell = 
  do
    (P.many P.digit) <|> P.many (P.noneOf ",\n[]")
    return ()
    
eol :: P.Parsec String () ()
eol =
  do
    matchString "\\n"
    return ()

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
  
quotes :: P.Parsec String () ()
quotes = 
  do
    P.char '\"'
    return ()

dash :: P.Parsec String () ()
dash = 
  do
    P.char '-'
    return ()    

colon :: P.Parsec String () ()  
colon =
  do
    P.char ':'
    return ()

openScBr :: P.Parsec String () ()
openScBr =
  do
    P.char '['
    return ()

closedScBr :: P.Parsec String () ()
closedScBr =
  do
    P.char ']'
    return ()    

matchString :: P.Stream s m Char => String -> P.ParsecT s u m ()
matchString a =
  do
    P.manyTill P.anyChar (P.string a)
    return ()
  
-- | I should probably parse it on one go, populating a respective
-- | data structure with relevant data.
geoParser = 
  do
    matchString "fileversion" >> quotes >> comma >> quotes
    majorVer     <- P.many1 P.digit
    dot             
    minorVer     <- P.many1 P.digit
    dot             
    buildVer     <- P.many1 P.digit
    let fileversion = majorVer ++ "." ++ minorVer ++ "." ++ buildVer

    matchString "hasindex" >> quotes >> comma
    index <- P.many1 P.letter
  
    matchString "pointcount" >> quotes >> comma
    pointcount   <- P.many1 P.digit

    P.try (matchString "vertexcount") <|> (matchString "fileversion" >> matchString "vertexcount")
    quotes >> comma
    vertexcount  <- P.many1 P.digit
  
    P.try (matchString "primitivecount") <|> (matchString "pointcount" >> matchString "primcount") >> quotes >> comma
    primcount    <- P.many1 P.digit

    matchString "info"
    matchString "software" >> quotes >> colon >> quotes
    softwareName <- P.many1 P.letter
    P.spaces
    majorVer     <- P.many1 P.digit 
    dot                             
    minorVer     <- P.many1 P.digit   
    dot                               
    buildVer     <- P.many1 P.digit 
    let software =
          softwareName ++ " " ++ majorVer ++ "." ++ minorVer ++ "." ++ buildVer

    matchString "hostname" >> quotes >> colon >> quotes
    hostname     <- P.many1 P.letter

    matchString "artist" >> quotes >> colon >> quotes
    artist       <- P.many1 P.letter

    matchString "date" >> quotes >> colon >> quotes
    year         <- P.many1 P.digit
    dash
    month        <- P.many1 P.digit
    dash
    day          <- P.many1 P.digit
    P.spaces 
    hours        <- P.many1 P.digit
    colon
    minutes      <- P.many1 P.digit
    colon
    seconds      <- P.many1 P.digit

    let date     = year ++ "-" ++ month ++ "-" ++ day        
                   ++ " " ++                                 
                   hours ++ ":" ++ minutes ++ ":" ++ seconds 

    matchString "time" >> quotes >> colon
    time         <- P.many1 P.digit

    matchString "bounds" >> quotes >> colon >> openScBr
    bounds'      <- P.sepBy (P.many (P.oneOf "-.0123456789")) comma
    let bounds   = fmap read bounds'

    matchString "primcount_summary" >> quotes >> colon >> quotes
    P.spaces
    primsum      <- P.many1 P.digit
    P.spaces
    primsum'     <- P.many1 P.letter

    matchString "attribute_summary" >> quotes >> colon >> quotes
    P.spaces
    nvtxattrs    <- P.many1 P.digit
    P.spaces
    vertex       <- P.many1 P.letter
    P.spaces
    vtxattrs     <- P.many1 P.letter
    colon >> tab
    vtxattrname  <- P.many1 P.letter
    eol >> P.spaces
    nptattrs     <- P.many1 P.digit
    P.spaces
    point        <- P.many1 P.letter
    P.spaces
    ptattrs      <- P.many1 P.letter
    colon >> tab
    ptattrname   <- P.many1 P.letter

    let attrsum  = nvtxattrs ++ " " ++ vertex ++ " " ++ vtxattrs ++ ":" ++ vtxattrname
                   ++ ", " ++
                   nptattrs  ++ " " ++ point  ++ " " ++ ptattrs  ++ ":" ++ ptattrname

    matchString "topology"
    topology     <- P.many1 P.anyChar
    let topology'= "[\\n\"topology\\n" ++ topology
    -- matchString "pointref"
    -- matchString "indices"
    -- matchString "attributes"
    -- matchString "vertexattributes"

    -- topology <- (return "suka")
    
    return ( Geo 
               fileversion
               index                  
               pointcount             
               vertexcount            
               primcount
               ( Info
                   software
                   hostname
                   artist
                   date
                   time
                   bounds
                   (read primsum, primsum')
                   attrsum
               )
               topology'
           )


main :: IO ()
main = 
  do
    text <- getText
    let text1 = lines text
    mapM_ print text1

    foo <- parse (geoParser) text
    print foo

