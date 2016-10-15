#!/bin/sh
# Enter the script code as the first argument 
# and number of pages to download as the second argument
# example: `sh lazybee.sh 1496 96`

# Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rSaving page $(( $1 + 1 )) of $2 [${_fill// /#}${_empty// /-}] ${_progress}%% "
}

echo 'Created Folder LZB-Scripts'
echo 'Collecting images in LZB-Scripts'
mkdir LZB-Scripts
cd LZB-Scripts
for i in `seq 0 $(( $2 - 1 ))`; 
do
	curl -s 'http://www.lazybeescripts.co.uk/Scripts/ImageSourceThree.aspx?iSS='$1'&iPg='$i -H 'Referer: http://www.lazybeescripts.co.uk/Scripts/script.aspx' -o page$(( $i + 1 )).jpg
    ProgressBar ${i} $2
done
