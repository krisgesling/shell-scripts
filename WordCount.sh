#!/bin/bash

# CONFIG VARIABLES
ignoreChars=',.?!'
# Filenames can be overwritten by user parameters
wholeWordFile='ym.txt'
glossFile='ymg.txt'
outputFile='Freq-Count_'"$(date '+%Y-%m-%d-%H:%M:%S')"'.txt'

while getopts "w:g:o:" OPTION
do
	case $OPTION in
		w)
			wholeWordFile=$OPTARG
			;;
    g)
			glossFile=$OPTARG
			;;
    o)
			outputFile=$OPTARG
			;;
	esac
done

touch $outputFile

echo '****************************' >> $outputFile
echo '*** Whole word frequency ***' >> $outputFile
echo '****************************' >> $outputFile
echo ' ' >> $outputFile
cat $wholeWordFile | sed 's|['$ignoreChars']||g' | tr ' ' '\n' | sort | uniq -ic | sort -nr >> $outputFile

echo ' ' >> $outputFile
echo ' ' >> $outputFile
echo '****************************' >> $outputFile
echo '*** Gloss word frequency ***' >> $outputFile
echo '****************************' >> $outputFile
echo ' ' >> $outputFile
cat $glossFile | tr '/' ' ' | sed 's|['$ignoreChars']||g' | tr ' ' '\n' | sort | uniq -ic | sort -nr >> $outputFile

echo ' ' >> $outputFile
echo ' ' >> $outputFile
echo '**********************' >> $outputFile
echo '*** Words per line ***' >> $outputFile
echo '**********************' >> $outputFile
echo ' ' >> $outputFile
lineNum=1
cat $wholeWordFile | while read line;do
  echo $line | wc -w >> $outputFile
  ((lineNum++))
done
