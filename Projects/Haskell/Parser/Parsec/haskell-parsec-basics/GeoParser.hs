{-# LANGUAGE FlexibleContexts #-}
module GeoParser where

import qualified Text.Parsec as P
import qualified Data.ByteString.Lazy.Char8 as BC       
import Control.Applicative
import Control.Monad.Identity (Identity)
import qualified Data.ByteString.Lazy as B       

data Geo = 
     Geo
       { fileversion    :: String 
       , hasindex       :: String 
       , pointcount     :: String 
       , vertexcount    :: String
       , primitivecount :: String
       , info           :: Info
       } deriving Show

data Info =
     Info 
       { software    :: String
       , hostname    :: String
       , artist      :: String
       , date        :: String
       , time        :: String
       , bounds      :: [Double]
       , primsum     :: (Integer, String)
       -- , attrsum     :: String
       } deriving Show

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

cell :: P.Parsec String () ()
cell = 
  do
    (P.many P.digit) <|> P.many (P.noneOf ",\n[]")
    return ()
    
eol :: P.Parsec String () ()
eol =
  do
    P.char '\n'
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

newline :: P.Parsec String () ()  
newline =
  do
    P.char '\n'
    return ()

col :: P.Parsec String () ()  
col =
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
  
    P.try (matchString "primitivecount") <|> (matchString "pointcount" >> matchString "primitivecount") >> quotes >> comma
    primcount    <- P.many1 P.digit

    matchString "info"
    matchString "software" >> quotes >> col >> quotes
    softwareName <- P.many1 P.letter
    P.spaces
    majorVer     <- P.many1 P.digit 
    dot                             
    minorVer     <- P.many1 P.digit   
    dot                               
    buildVer     <- P.many1 P.digit 
    let software =
          softwareName ++ " " ++ majorVer ++ "." ++ minorVer ++ "." ++ buildVer

    matchString "hostname" >> quotes >> col >> quotes
    hostname     <- P.many1 P.letter

    matchString "artist" >> quotes >> col >> quotes
    artist       <- P.many1 P.letter

    matchString "date" >> quotes >> col >> quotes
    year         <- P.many1 P.digit
    dash
    month        <- P.many1 P.digit
    dash
    day          <- P.many1 P.digit
    P.spaces 
    hours        <- P.many1 P.digit
    col
    minutes      <- P.many1 P.digit
    col
    seconds      <- P.many1 P.digit

    let date     = year ++ "-" ++ month ++ "-" ++ day        
                   ++ " " ++                                 
                   hours ++ ":" ++ minutes ++ ":" ++ seconds 

    matchString "time" >> quotes >> col
    time         <- P.many1 P.digit

    matchString "bounds" >> quotes >> col >> openScBr
    bounds'      <- P.sepBy (P.many (P.oneOf "-.0123456789")) comma
    let bounds   = fmap read bounds'

    matchString "primcount_summary" >> quotes >> col >> quotes
    P.spaces
    primsum      <- P.many1 P.digit
    P.spaces
    primsum'    <- P.many1 P.letter
    
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
               )
           )


main :: IO ()
main = 
  do
    text <- getText
    let text1 = lines text
    mapM_ print text1

    foo <- parse (geoParser) text
    print foo

