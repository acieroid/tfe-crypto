#!/bin/bash

FILES="texte/Makefile texte/*.tex texte/annexes/*.tex texte/bibliographie/*.bib texte/contenu/*.tex texte/images/*.png texte/images/*.svg texte/images/*.jpg texte/dia/*.dia texte/src/README texte/src/*.c texte/src/*.hs texte/src/*.scm texte/src/*.py texte/src/*.lisp texte/plan texte/todo texte/sourcesimages"

ARCHIVE="tfe-`date +\"%d-%m-%y\"`.tar.gz"
GMAILFSPATH=/mnt/gmailfs
SUBDIR=tfe/
TUXFAMILYADDR=ssh.tuxfamily.org
TUXFAMILYUSER=acieroid
TUXFAMILYPATH=/home/acieroidweb/acieroid.tuxfamily.org-web/htdocs/tfe/archives/

echo "Packaging ..."
tar -czvf $ARCHIVE $FILES
echo "Sending on gmailfs"
sudo mount.gmailfs none $GMAILFSPATH
sudo cp $ARCHIVE $GMAILFSPATH/$SUBDIR

echo "Scping to tuxfamily"
scp $ARCHIVE $TUXFAMILYUSER@$TUXFAMILYADDR:$TUXFAMILYPATH

echo "Ok"
