module Main where
import System (getArgs)
import IO
import Char (chr, ord, isUpper)

-- La position d'une lettre dans l'alphabet
place :: Char -> Int
place c    = (ord c) -
                  if isUpper c 
                  then 65
                  else 97

-- La 
lettre :: Int -> Char
lettre n   = chr (n+97)

vigenereZip :: String -> String -> [(Char,Char)]
-- Pas de clé
vigenereZip _ [] = error "No key specified"
-- Une chaîne vide
vigenereZip [] _ = []
-- Un seul caractère à coder
-- Plusieurs caractères
vigenereZip message key
    -- La message est plus long que la clé 
    | msgSize > keySize  = zip (take keySize message) key ++ 
                               vigenereZip (drop keySize message) key
    -- Message plus court que la clé : fin du codage
    | msgSize < keySize  = zip message (take msgSize key)
    -- Même taille
    | msgSize == keySize = zip message key
    where msgSize = (length message)
          keySize = (length key)

vigenere :: String -> String -> String
vigenere message key = map encode (vigenereZip message key)
         where encode (c,k) = chr (rem (ord c + ord k) 128)

devigenere message key = map decode (vigenereZip message key)
           where decode (c,k) =chr (abs (rem (place c - place k) 128))


doEncodingLoop key = do
                        str <- getLine
                        putStrLn (vigenere str key)
                        doEncodingLoop key
doDecodingLoop key = do
                        str <- getLine
                        putStrLn (devigenere str key)
                        doDecodingLoop key

help = do
         putStrLn "Usage : vigenere <action> <key>"
         putStrLn " <action> : -c to encode, -d to decode, nothing encodes"
         putStrLn " <key> : Your key"
main = do
        args <- getArgs
        
        case (length args) of
             -- Juste la clé, on encode
             1 -> doEncodingLoop (args !! 0)
             -- Un autre argument, soit -c pour encoder, soit -d pour décoder
             2 -> case (args !! 0) of 
                       "-c" -> doEncodingLoop (args !! 1)
                       "-d" -> doDecodingLoop (args !! 1)
                       _    -> help
             otherwise -> help
