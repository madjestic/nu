{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
import Data.Aeson
import Data.Aeson.BetterErrors
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as B
import GHC.Generics

data Tuples = Tuples [Point3] deriving Show
type Point3 = (Double, Double, Double)

data Geo =
     Geo
     {
       tuples :: [Point3]
     } deriving Show

instance FromJSON Geo where
  parseJSON (Object o) =
     Geo
       <$> ((o .: "Geo") >>= (.: "tuples"))
  parseJSON _ = mzero

instance FromJSON Tuples where
    parseJSON (Object o) =
      do
        pts <- o .: "tuples"
        fmap Tuples $ parseJSON pts
    parseJSON _ = mzero
  
jsonFile :: FilePath
jsonFile = "model.pgeo"           

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

main :: IO ()
main =
  do
    d <- (eitherDecode <$> getJSON) :: IO (Either String Geo)
    case d of
      Left err -> putStrLn err
      Right ps -> print ps
