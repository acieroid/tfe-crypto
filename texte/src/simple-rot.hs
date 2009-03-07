module Main where
import CryptoUtils (index,capitalLetter,rotate)
import System (getArgs)

main = do
  args <- getArgs
  content <- case length args of
               0 -> error "Not enough parameters, 1 or 2 required"
               1 -> getContents
               2 -> return (args !! 1)
  putStrLn $ 
           map (rotate (read (head args) :: Int)) content