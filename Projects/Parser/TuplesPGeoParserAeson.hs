{-# LANGUAGE OverloadedStrings #-}
import Data.Aeson
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as B

data Tuples = Tuples [Point3] deriving Show
type Point3 = (Double, Double, Double)

instance FromJSON Tuples where
    parseJSON (Object o) =
      do
        pts <- o .: "tuples"
        fmap Tuples $ parseJSON pts
    parseJSON _ = mzero

jsonFile :: FilePath
jsonFile = "tuples.pgeo"           

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

main :: IO ()
main =
  do
    d <- (eitherDecode <$> getJSON) :: IO (Either String Tuples)
    case d of
      Left err -> putStrLn err
      Right ps -> print ps
