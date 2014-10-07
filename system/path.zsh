if [[ $(hostname) == *lxplus* ]] then
  export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc5-gcc46-opt/lib:$LD_LIBRARY_PATH;
  export PATH=$HOME/.local/bin:$PATH
fi