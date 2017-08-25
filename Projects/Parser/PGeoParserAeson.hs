{-# LANGUAGE OverloadedStrings #-}
import Data.Aeson
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as B

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

fromEitherDecode :: Either t a -> Maybe a
fromEitherDecode d =
  do
    case d of
      Left err -> Nothing
      Right ps -> Just ps

fromMaybe :: Maybe Geo -> Geo
fromMaybe (Just x) = x

fromGeo :: Geo -> [Point3]
fromGeo (Geo {tuples = x}) = x

main :: IO ()
main =
  do
    d <- (eitherDecode <$> getJSON) :: IO (Either String Geo)
    case d of
      Left err -> putStrLn err
      Right ps -> print ps
    let geoPoints =
          fromGeo $ fromMaybe $ fromEitherDecode d
    print geoPoints
