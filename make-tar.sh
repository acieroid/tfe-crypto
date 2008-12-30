#!/bin/bash

FILES="texte/Makefile texte/*.tex texte/annexes/*.tex texte/bibliographie/*.bib texte/contenu/*.tex texte/images/*.png texte/images/*.svg texte/images/*.jpg texte/dia/*.dia texte/src/README texte/src/*.c texte/src/*.hs texte/src/*.scm texte/src/*.py texte/src/*.lisp texte/plan texte/todo texte/sourcesimages"

tar -czvf "tfe-`date +\"%d-%m-%y\"`.tar.gz" $FILES
#echo $FILES
