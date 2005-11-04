#! /bin/sh

DIR=$1
AWK_PROGRAM=/usr/local/share/FaxProcess/regex.awk
FILE_PATTERN=*.spl

function checkPrereqs ()
{	
	type $1 > /dev/null 2>&1
	return $?
}

function getCustFaxnumber () 
{
	FAX_NUMBER=`gawk -f $AWK_PROGRAM $1`	
}

if ! checkPrereqs sendfax ; then
	echo $0: "sendfax missing - process cannot continue :-("
	exit 1
fi

if ! checkPrereqs a2ps ; then
	echo $0: "a2ps missing - process cannot continue :-("
	exit 1
fi

# check, if any files available - eles exit gracefuly
if ! ls $1/$FILE_PATTERN > /dev/null 2>&1 ; then
	exit 0
fi

# create processed directory if it not already exists 
if [ ! -d $1/processed ] ; then
	mkdir $1/processed
fi

for file in $( ls $1/*.spl); do
	getCustFaxnumber $file
	a2ps -1 --no-header --print-anyway=yes $file -o $file.ps
	echo sendfax -a4 -m -d $FAX_NUMBER $file.ps
	mv $file $1/processed
	rm $file.ps
done