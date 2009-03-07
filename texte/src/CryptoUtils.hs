module CryptoUtils where
import Char (chr, ord, toLower)
import List (group,sort)

-- La position d'une lettre dans l'alphabet
-- En ascii : 'a' -> 97 ; 'A' -> 65
index :: Char -> Int
index c | pos >= 65 && pos <= 90 = pos - 65
        | pos >= 97 && pos <= 122 = pos - 97
        | otherwise = error "Not a letter"
        where pos = ord c

-- La lettre de l'alphabet correspondant à x
-- 0 <= x <= 25
-- En majuscule
capitalLetter :: Int -> Char
capitalLetter x | x <= 25 && x >= 0 = chr $ x+65
                | otherwise = error "Bad index"
-- En miniscule
smallLetter :: Int -> Char
smallLetter = toLower . capitalLetter

-- Compte le nombre de lettre qui apparaissent dans la chaîne
count :: String -> [(Int,Char)]
count s = map (\x -> (length x,head x)) 
          $ group $ sort s

-- Analyse des fréquences
freqs :: String -> [(Int, Int)]
freqs s = reverse (sort (count s))

-- Effectue un simple décalage de la lettre dans l'alphabet
-- Pas de restriction sur le décalage (positif, négatif, peu importe)
rotate :: Int -> Char -> Char
rotate d c = capitalLetter $ mod (index c + d) 26

-- Factorise un nombre
-- Retourne la liste de ses diviseurs
factorize :: Int -> [Int]
factorize 1 = []
factorize n = factorize' 2
              where factorize' acc | (div n 2) < acc  = [n]
                                   | (rem n acc) == 0 = 
                                        acc:(factorize (div n acc)) 
                                   | otherwise        = 
                                        (factorize' (acc+1))
