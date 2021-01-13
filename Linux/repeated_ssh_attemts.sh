#! /bin/bash
#define variables
web1=0
web2=0
web3=0
#loop running for 100 times per ssh command
while [ "$web1" -lt 100 ] | [ "$web2" -lt 100 ] | [ "$web3" -lt 100 ]
	do
	#run command to ssh as a searchable username
		ssh yoyo@10.0.0.4
		ssh yoyo@10.0.0.5
		ssh yoyo@10.0.0.7
	#increment each by 1 to avoid infinite loop
	let web1=web1+1
	let web2=web2+1
	let web3=web3+1
	echo $web1 $web2 $web3
	done
