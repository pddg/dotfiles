# To detect OS types
ostype() {
	    uname | tr "[:upper:]" "[:lower:]"
}

case "$(ostype)" in
  *'linux'*)	PLATFORM='linux' ;;
  *'darwin'*)	PLATFORM='osx' ;;
  *'bsd'*)		PLATFORM='bsd' ;;
  *)			PLATFORM='unknown' ;;
esac

# enable common settings

source $HOME/.bashrc.common

# processing based on PLATFORM
if [ "$PLATFORM" = "osx" ]; then 
  source $HOME/.bashrc.osx
elif [ "$PLATFORM" = "linux" ]; then
  source $HOME/.bashrc.linux
fi


# added by travis gem
[ -f /Users/pudding/.travis/travis.sh ] && source /Users/pudding/.travis/travis.sh
