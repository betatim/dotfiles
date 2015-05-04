# detect EPFL machines by username :-/
if [ "$(hostname -d)" = "epfl.ch" ]
then
    export PATH="/home/head/anaconda/bin:$PATH"
fi
