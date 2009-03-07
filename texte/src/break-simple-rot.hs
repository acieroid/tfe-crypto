module Main where
import CryptoUtils (count,index,rotate)
import List (sort)
import System (getArgs)
import IO(hFlush, stdout)
 

-- Demande une entrée à l'utilisateur
ask :: String -> IO String
ask s = do
  putStr s
  hFlush stdout
  getLine

-- Essaye de casser le code via l'analyse de fréquence
-- Le paramètre x permet de ne pas prendre les x éléments les plus
-- fréquents
-- Retourne le décalage utilisé
tryBreak :: String -> Int -> Int
tryBreak s x = shift
    where letters = drop x $ reverse $ sort $ count s
          shift = mod ((index ciphered) - (index 'e')) 26
          ciphered = if letters == [] then
                         error "All possibilities tested"
                     else (snd $ head letters)

breakLoop s n | n > 25 = return ()
              | otherwise = do
                              putStrLn ("Key : " ++ (show key) 
                                        ++ " - Beginning of the text : "
                                        ++ (take 25 $ map (rotate (-key)) s))
                              resp <- ask "Retry ? (y/N) : "
                              case resp of
                                "y" -> breakLoop s (n+1)
                                "n" -> return ()
                                _  -> return ()
              where key = tryBreak s n
       

bruteForce s = bruteForce' 0
               where bruteForce' n | n > 25 = return ()
                                   | otherwise = do
                       putStrLn ("Key : " ++ (show n)
                                 ++ " - Beginning of the text : "
                                 ++ (take 25 $ map (rotate (-n)) s))
                       bruteForce' (n+1)
main = do
  args <- getArgs
  content <- case length args of 
               0 -> error "Not enough paremeters, 1 or 2 required"
               1 -> getContents
               2 -> return (args !! 1)
  case args !! 0 of
    "break" -> breakLoop content 0
    "bruteforce" -> bruteForce content
    _ -> putStrLn "Parameters : break or bruteforce"
