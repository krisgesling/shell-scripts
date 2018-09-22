#!/bin/bash

# CONFIG VARIABLES
ignoreChars=',.?!'
outputFileName='Freq-Count_'"$(date '+%Y-%m-%d-%H:%M:%S')"'.txt'

if [ $1 ]
  then
    wholeWordFile=$1
  else
    wholeWordFile='ym.txt'
fi
if [ $2 ]
  then
    glossFile=$2
  else
    glossFile='ymg.txt'
fi
if [ $3 ]
  then
    outputFile=$3
  else
    outputFile=$outputFileName
fi

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
