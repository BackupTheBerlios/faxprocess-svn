#! /bin/sh

INSTALL_DIR=/usr/local/share/FaxProcess

echo Installing to $INSTALL_DIR

mkdir $INSTALL_DIR

cp faxprocess.sh $INSTALL_DIR
chown root.root $INSTALL_DIR/faxprocess.sh
chmod 755 $INSTALL_DIR/faxprocess.sh

cp regex.awk $INSTALL_DIR
chown root.root $INSTALL_DIR/regex.awk

cp Kundenliste $INSTALL_DIR
chown root.root $INSTALL_DIR/Kundenliste