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

source .bashrc.common

# processing based on PLATFORM
if [ "$PLATFORM" = "osx" ]; then 
  source .bashrc.osx
elif [ "$PLATFORM" = "linux" ]; then
  source .bashrc.linux
fi

