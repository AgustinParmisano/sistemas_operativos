
#!/bin/sh
 
PORT=21111
 
usage() {
    echo "Usage: $0 <c|s> <nickname> # c stands for client, s for server"
}
 
prepend_nickname() {
    while read line
    do
        echo "$(date), $1 says:"
        echo $line
    done
}    
 
if [ $# -ne 2 ]; then
    usage
fi
 
if [ "$1" != "c" ] && [ "$1" != "s" ]; then
    echo "First parameter must be 'c', for client mode, or 's', for server mode."
fi
 
IFSERVER=""
if [ "$1" = "s" ]; then
    IFSERVER="-l"
fi
 
cat | prepend_nickname $2 | nc $IFSERVER 127.0.0.1 $PORT
