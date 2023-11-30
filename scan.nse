
portrule = function(host,port)
	return port.protocol== "tcp"
		and port.state == "open"
end
	
	
action = function(host,port)
	return "Port open"
end
