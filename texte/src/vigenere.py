# Chiffre de Vigenere pour l'ASCII

def crypt(string, key):
    coded = ""
    i = 0
    while i < len (string):
        j = 0
        while j < len (key) and i < len (string):
            coded += chr ((ord (string[i]) + 
                           ord (key[j]))
                          % 128)
            j += 1
            i += 1
    return coded

def decrypt(string, key):
    decoded = ""
    i = 0
    while i < len (string):
        j = 0
        while j < len (key) and i < len (string):
            decoded += chr ((ord (string[i]) -
                             ord (key[j]))
                            % 128)
            j += 1
            i += 1
    return decoded
