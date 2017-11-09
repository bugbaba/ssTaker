#!/bin/bash
# program to take Screenshot of  given urls
#thanks to Bjoern Hoehrmann for making cutycapt - http://cutycapt.sf.net

clear # To clear the terminal 

cat << "EOF"
             .--.         .--.
                 \       /        
          |\      `\___/'       /|
           \\    .-'@ @`-.     //  
           ||  .'_________`.  ||
            \\.'^    Y    ^`.//
            .'       |       `.
           :         |         :
          :          |          :
          :          |          :
          :     _    |    _     :
          :.   (_)   |   (_)    :
        __::.        |          :__
       /.--::.       |         :--.\
    __//'   `::.     |       .'   `\\___
   `--'     //`::.   |     .'\\     `--'
            ||  `-.__|__.-'   || 
            ||                ||
            //                \\
           |/                  \|

     	 ssTaker By @nomanAli181
EOF

makefile(){

	output="`date +%b-%a-%H-%M`"
	mkdir $output
	
	echo "
	<html>
	<title> ssTaker Report</title>
	<body> <center> 
	<h3> Report started at : $output </h3>
	<table border='1'>
	<th> Site </th>
	<th> Screenshot </th>
	
	" >> $output/report.html
}

main(){
	
	for url in $(cat $filename); do
	
	cutycapt --insecure --url=$url --out=$output/$url.jpg --max-wait=50000    #the Main line   
							         # Change this value to speed a bit 		
	echo "
	<tr>
		<td> 
			<div style='display: inline-block; width: 300px; word-wrap: break-word'>
			<a href='http://$url' target='_blank'><b>$url</b></a> </div>
		</td>	
		
		<td> 
			<div id='screenshot' style='display: inline-block; width:650px; height 400px; overflow: scroll;'>
			<a href='`echo $url | cut -d '/' -f3`.jpg' target='_blank'>
			<img src='`echo $url | cut -d '/' -f3`.jpg' height='400'></a></div>	
		</td>
	</tr>
	" >> $output/report.html

	done > /dev/null  2>&1 # i like my screen clean 
}

filter(){
	
	find -iname '*.jpg' -size -10k -exec rm  {} \; 
}

if [ $# = 0 ]; then

	echo ""
	echo "[+] Provide a file with urls in it"


elif [ $# != 0 ]; then

	filename=${1}

	if [ "`ls $filename`" ]; then
		
		echo ""
		echo "[+] Process started " 
		makefile
		main
		filter
		echo ""
		echo "Check the $output folder for Report"
		echo ""
	fi

fi
