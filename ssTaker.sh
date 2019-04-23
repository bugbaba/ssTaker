#!/bin/bash
# program to take Screenshot of  given urls
# Thanks to Bjoern Hoehrmann for making cutycapt - http://cutycapt.sf.net
# Added flags 0n Dec 2018

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

	output=$(date +%b-%a-%H-%M)
	if [ -d "$output" ]; then
		echo "$output already exist!"
	else
		mkdir $output
	fi

	echo "
	<html>
	<title> ssTaker Report</title>
	<body> <center>
	<h3> Report made on: $output </h3>
	<table border='1'>
	<th>Site</th>
	<th>Screenshot</th>
	" >> $output/report.html
}

main(){

	if [ -z ${port_array+x} ]; then

		for url in $(cat $filename); do
		#cutycapt --insecure --url=$url --out=$output/$url.jpg --max-wait=50000
		xvfb-run -a cutycapt --insecure --url=$url --out=$output/$url.jpg --max-wait=50000 #for headless machines
		echo cutycapt --insecure --url=$url --out=$output/$url.jpg --max-wait=50000 # debug -_-
		echo "
		<tr>
			<td>
				<div style='display: inline-block; width: 200px; word-wrap: break-word'>
					<a href='http://$url' target='_blank'><b>$url</b></a>
				</div>
			</td>

			<td>
				<div id='screenshot' style='display: inline-block; width:750px; height 400px; overflow: scroll;'>
					<a href=$url.jpg target='_blank'><img src=$url.jpg height='400' width='90%' border='1'></a>
				</div>
			</td>
		</tr>
		" >> $output/report.html

		done > /dev/null 2>&1
		#remove this if you want verbose output

	else

		for domain in $(cat $filename); do

			for port in "${!port_array[@]}"; do

			if [[ ${port_array[$port]} == +('443'|'8443') ]]; then

				url=https://$(echo $domain | tr -d '\r'):${port_array[$port]}
			else
				url=http://$(echo $domain | tr -d '\r'):${port_array[$port]}
			fi

			image=$(echo $output/$url | cut -d '/' -f4 | tr ':' '_').jpg
			echo cutycapt --insecure --url=$url --out=$output/$image --max-wait=50000 # debug -_-
			#cutycapt --insecure --url=$url --out=$output/$image.jpg --max-wait=50000
			xvfb-run -a cutycapt --insecure --url=$url --out=$output/$image --max-wait=50000 & #for headless machines


			echo "
				<tr>
					<td>
						<div style='display: inline-block; width: 200px; word-wrap: break-word'>
							<a href='$url' target='_blank'><b>$url</b></a>
						</div>
					</td>

					<td>
						<div id='screenshot' style='display: inline-block; width:750px; height 400px; overflow: scroll;'>
							<a href=$image target='_blank'><img src=$image height='400' width='90%' border='1'></a>
						</div>
					</td>
				</tr>
			" >> $output/report.html
			done  > /dev/null  2>&1
		wait
		done

	fi
}

filter(){

	find -iname '*.jpg' -size -10k -exec rm  {} \;
}

calling(){
		echo ""
		echo "[+] Process started "
		makefile
		main
		filter #use only if required
		echo ""
		echo "Check the $output folder for Report"
}

if [ $# = 0 ]; then

	echo ""
	echo "[+] Provide a file with urls in it"
	echo "Use --help for usage"


elif [[ $1 == '-h' ]] || [[ $1 == "--help" ]]; then

echo """

Usage: $0 [options]

$0 file.txt                    -> Screenshot of domains in file.txt
$0 -f file.txt		-> Screenshot of domains in file.txt
$0 -h                          -> Print this help message
$0 -f file.txt -p 80,443       -> Screenshot of domains in file.txt on specified ports
"""

elif [[ $1 == '-f' ]] && [[ $3 == '-p' ]]; then

	filename=${2}
	if  [[ $4 = '' ]]; then
		echo ""
		echo "No port specified"
		echo "[!] Error try --help for usage"

	elif [ -f "$filename" ]; then
		echo "File: $filename"
		port_array=(80 )
		port_array+=(`echo $4 | tr ',' ' '`)
		echo "Ports: ${port_array[@]}"
		calling
	else
		echo "File not found"
		echo "[!] Error try --help for usage"
	fi


elif [[ $1 == '-f' ]] && [[ $2 != '' ]]; then

	filename=${2}
	if [ -f "$filename" ]; then
		echo "File: $filename"
		calling
	else
		echo "[!] Error try --help for usage"
	fi

elif [[ $1 == '-f' ]] && [[ $2 == '' ]]; then

	echo ""
	echo "[!] Error try --help for usage"

else

	filename=${1}
	if [ -f "$filename" ]; then
		echo "File: $filename"
		calling
	else
		echo ""
		echo "[!] Error try --help for usage"
	fi

fi
