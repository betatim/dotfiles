oldpath=`pwd`
cd $(brew --prefix root)
. libexec/thisroot.sh
cd $oldpath
unset oldpath
