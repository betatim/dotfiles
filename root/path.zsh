if [ "$(uname -s)" = "Darwin" ]; then
  oldpath=`pwd`
  cd $(brew --prefix root)
  . libexec/thisroot.sh
  cd $oldpath
  unset oldpath
fi
