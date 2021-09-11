#!/bin/bash 
echo "
.
.";
echo "======================="
echo "+-+-+-+-+-+-+-+-+-+-+-+
|S|u|b|T|a|k|e|o|v|e|r|
+-+-+-+-+-+-+-+-+-+-+-+
======================@kab33r
";
read -p "Enter subdomains location: (ex: ~/Projects/targets/subdomains.txt) : " input
for i in ${input[@]}
do

echo "
.
.
.
Fetching Subdomains from $i
";
subzy -targets $i -hide_fails | grep "VULNERABLE" | tee takeoverresults.txt;
echo "
.
.
."; 
echo "Subdomain Takeover Results saved at takeoverresults.txt.";
echo "Total takeovers for subdomain file $i found:" | notify --silent;
wc takeoverresults.txt | awk '{print $1}' | notify --silent;
echo ".
.
.";done