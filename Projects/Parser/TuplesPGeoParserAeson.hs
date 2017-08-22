{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
import Data.Aeson
import Data.Aeson.BetterErrors
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as B
import GHC.Generics

data Tuples = Tuples [Point3] deriving Show
data Point3 = Point3 Double Double Double deriving Show

instance FromJSON Tuples where
    parseJSON (Object o) =
      do
        pts <- o .: "tuples"
        fmap Tuples $ parseJSON pts
    parseJSON _ = mzero

instance FromJSON Point3 where
    parseJSON obj = do
        [x, y, z] <- parseJSON obj
        return $ Point3 x y z

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
