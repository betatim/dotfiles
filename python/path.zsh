if [[ $(hostname) == *lxplus* ]] then
  export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/w/private/soft/lib/python2.7/site-packages:$PYTHONPATH
  export WORKON_HOME=$HOME/w/private/virtualenvs-py2.7
fi