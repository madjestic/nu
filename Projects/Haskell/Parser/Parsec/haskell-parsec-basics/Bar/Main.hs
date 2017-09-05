{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Aeson
import Data.Aeson.BetterErrors
import Control.Monad (mzero)
import qualified Data.ByteString.Lazy as B
import GHC.Generics

data JSON =
     JSON
       { resultSet :: ResultSet
       } deriving (Show, Generic)

data ResultSet =
     ResultSet
       {
         locations   :: [Location] -- !Array
       , arrivals    :: [Arrival]
       , queryTime   :: QueryTime
       } deriving Show

instance FromJSON ResultSet where
  parseJSON (Object o) =
     ResultSet
       <$> ((o .: "resultSet") >>= (.: "location"))
       <*> ((o .: "resultSet") >>= (.: "arrival"))
       <*> ((o .: "resultSet") >>= (.: "queryTime"))
  parseJSON _ = mzero

data Location =
     Location
       { desc           :: String
       , locid          :: Int
       , dir            :: String
       , lng            :: Double
       , lat            :: Double
       } deriving Show

instance FromJSON Location where
  parseJSON (Object o) =
     Location
       <$> (o .: "desc")
       <*> (o .: "locid")
       <*> (o .: "dir")
       <*> (o .: "lng")
       <*> (o .: "lat")
  parseJSON _ = mzero

data Arrival =
     Arrival
       { detour         :: Bool
       , status         :: String
       } deriving Show

instance FromJSON Arrival where
  parseJSON (Object o) =
    Arrival
      <$> (o .: "detour")
      <*> (o .: "status")
  parseJSON _ = mzero

type QueryTime = String

jsonFile :: FilePath
jsonFile = "data.json"            

getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

asLocation :: Parse e Location
asLocation =
  Location
    <$> key "desc"  asString
    <*> key "locid" asInCtegral
    <*> key "dir"   asString
    <*> key "lng"   asRealFloat
    <*> key "lat"   asRealFloat

asArrival :: Parse e Arrival
asArrival =
  Arrival
    <$> key "detour" asBool
    <*> key "status" asString

asResultSet :: Parse e ResultSet
asResultSet =
  ResultSet
    <$> key "location"  (eachInArray asLocation)
    <*> key "arrival"   (eachInArray asArrival)
    <*> key "queryTime" (asString)

asJSON :: Parse e JSON
asJSON =
  JSON
    <$> key "resultSet" asResultSet

-- | You can test this manually by doing:
-- |> x <- getJSON
-- |> parse asJSON x
-- | This should give a nice readable error message

main :: IO ()
main =
  do
    d <- (eitherDecode <$> getJSON) :: IO (Either String ResultSet)
    case d of
      Left err -> putStrLn err
      Right ps -> print ps
