if [[ $(hostname) == *lxplus* ]] then
  export PYTHONPATH=$HOME/.local/lib/python2.7/site-packages:$HOME/w/private/soft/lib/python2.7/site-packages:$PYTHONPATH
  export WORKON_HOME=$HOME/w/private/virtualenvs-py2.7
  source $HOME/.local/bin/virtualenvwrapper.sh
elif [ "$(hostname -d)" = "epfl.ch" ]; then
  #echo "at epfl"
else
  export WORKON_HOME=$HOME/virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

# Tell pip to work in the currently actived virtualenv by default
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
