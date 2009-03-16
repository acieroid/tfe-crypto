#!/bin/sh
PATHTOXOR=./xor
KEYFILE=./key
MESSAGESIZE="`du $1 | awk '{print $1}'`"
function random_generator {
  dd if=/dev/random of=$1 bs=1 count=$2
}
echo "Message file : $1"

echo "Size : $MESSAGESIZE Bytes"

echo "Generating key"
random_generator $KEYFILE $MESSAGESIZE

echo "Encryption"
$PATHTOXOR $1 $KEYFILE > "$1-xored"
echo "Enciphered message saved in $1-xored"
