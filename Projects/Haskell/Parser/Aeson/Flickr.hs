{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Control.Monad
import Data.Aeson
import qualified Data.ByteString.Lazy as B
import Data.Text
import GHC.Generics

-- instance ToJSON Photoset where
--     toEncoding = genericToEncoding defaultOptions
instance FromJSON Photoset where
  parseJSON (Object o) =
    Photoset
      <$> o .: "id"
      <*> o .: "primary"
      <*> o .: "owner"
      <*> o .: "ownername"
      <*> o .: "photo"
      <*> o .: "page"
      <*> o .: "per_page"
      <*> o .: "per_page"
      <*> o .: "pages"
      <*> o .: "total"
      <*> o .: "title"
  parseJSON _ = mzero


instance FromJSON Photo where
  parseJSON (Object v) =
    Photo
      <$> v .: "id"
      <*> v .: "secret"
      <*> v .: "server"
      <*> v .: "farm"
      <*> v .: "title"
      <*> v .: "isprimary"
      <*> v .: "ispublic"
      <*> v .: "isfriend"
      <*> v .: "isfamily"
  parseJSON _ = mzero
    

instance FromJSON FlickResponce where
  parseJSON (Object v) =
    FlickResponce
      <$> v .: "photoset"
      <*> v .: "stat"

-- instance ToJSON Photo where
--     toEncoding = genericToEncoding defaultOptions                                   
-- instance FromJSON Photo


data Photoset =
     Photoset
        { photosetid :: Text
        , primary    :: Text
        , owner      :: Text 
        , ownername  :: Text
        , photo      :: [Photo]  
        , page       :: Int
        , per_page   :: Int
        , perpage    :: Int
        , pages      :: Int
        , total      :: Text
        , name       :: Text
        } deriving (Show,Generic)


data Photo =
     Photo
        { photoid    :: Text
        , secret     :: Text
        , server     :: Text
        , farm       :: Int
        , title      :: Text
        , isprimary  :: Text
        , ispublic   :: Int
        , isfriend   :: Int
        , isfamily   :: Int
        } deriving (Show, Generic)


data FlickResponce =
     FlickResponce
        { photoset   :: Photoset
        , stat       :: Text
        } deriving (Show, Generic)


jsonFile :: FilePath
jsonFile = "photos.json"            
         
getJSON :: IO B.ByteString
getJSON = B.readFile jsonFile

main = do
      d <- (eitherDecode <$> getJSON) :: IO (Either String FlickResponce)
      case d of
        Left err -> putStrLn err
        Right ps -> print ps

