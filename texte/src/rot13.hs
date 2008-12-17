module Main where
import Char (chr, ord, isUpper)
import IO

place :: Char -> Int
place c    = (ord c) -
                  if isUpper c 
                  then 65
                  else 97

lettre :: Int -> Char
lettre n   = chr (n+97)

rot13 :: Char -> Char
rot13 c   =  chr (rem ((place c) + 13) 26)

code :: [Char] -> [Char]
code [] = []
code (c:cs)     = if place c >= 0 && place c < 26 
                  then chr ((ord (rot13 c)) + (if isUpper c then 65 else 97))
                       : code cs
                  else
                       c : code cs
                   


main = interact (code)
{-do
    c <-getContents 
    putStrLn (code c) 
-}
