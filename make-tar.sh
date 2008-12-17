#!/bin/bash

FILES="texte/*.tex texte/annexes/*.tex texte/bibliographie/*.bib texte/contenu/*.tex texte/images/*.png texte/dia/*.dia texte/src/README texte/src/*.c texte/src/*.hs texte/src/*.scm texte/src/*.py texte/src/*.lisp texte/eps/*.eps texte/plan texte/todo"

tar -czvf "tfe-`date +\"%d-%m-%y\"`.tar.gz" $FILES
#echo $FILES
