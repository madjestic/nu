{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
module Maine where

import qualified Text.Parsec as P
import Text.Parsec ((<?>))
import qualified Data.ByteString.Lazy.Char8 as BC       
import Control.Applicative
import Control.Monad.Identity (Identity)
import qualified Data.ByteString.Lazy as B       

parse rule text = P.parse rule "source" text  
      
parse1 rule text = do
  let foo = P.parse rule "source" text
  return foo

jsonFile :: FilePath
jsonFile = "model.geo"            

getJson :: IO B.ByteString
getJson = B.readFile jsonFile          

-- parse (P.char '[') text
getText = do
  textJson <- getJson
  let text = BC.unpack textJson -- here file gets read as a bytesting and byte8 representation is converted into [Char]
  return text
   
sepByComma :: P.Parsec String () ()
sepByComma = do
  P.spaces
  P.char ','
  P.spaces
  return ()

class FromParserType a where
      toString :: Either P.ParseError a -> [Char]
instance FromParserType [Char] where
         toString :: Either P.ParseError [Char] -> [Char]
         toString (Right x) = x
         toString (Left _ ) = "source"
instance FromParserType ([Char], [Char], [Char]) where
         toString :: Either P.ParseError ([Char], [Char], [Char]) -> [Char]
         toString (Right (x,y,z)) = x ++ "." ++ y ++ "." ++ z
         toString (Left _ ) = "source"

-- geoParser :: P.P String () (String)
fileVersion = do
  --letters <- P.many1 P.letter
  P.char '[' `P.endBy` P.char '\n'
  P.char '\t' >> P.char '\"'
  P.many1 P.letter >>  P.char '\"'>> sepByComma >> P.char '\"'
  majorVer <- P.many1 P.digit
  P.char '.'
  minorVer <- P.many1 P.digit
  P.char '.'
  buildVer <- P.many1 P.digit
  return ((majorVer, minorVer, buildVer))


main = do
     text <- getText
     print text
     bar <- parse1 (fileVersion) text     
     print $ toString bar
