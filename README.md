# shell-scripts
Random shell scripts to do stuff...

## WordCount.sh
Counts frequency of whole and glossed words, sorting from highest-lowest frequency.  
Counts number of words per line in wholeWord file. Not sorted.

**Usage**  
`./WordCount.sh -w wholeWordFile -g glossedFile -o outputFile`

| Flag | Variable | Default
| --- | --- | --- |
| -w | wholeWordFile | ym.txt |
| -g | glossedFile | ymg.txt |
| -o | outputFile | Freq-Count_DATESTAMP.txt |
