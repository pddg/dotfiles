# Functions

WORKING_DIR=$HOME/dotfiles
EXPECTED_APPS_CSV=$WORKING_DIR/etc/mac_apps.csv

script_section() {
  echo -e "\033[1;34m->\033[0;39m\033[1;37m$@\033[0;39m"
}

info() {
  echo -e "\t\033[0;32mINFO:\033[0;39m\t$@"
}

warn() {
  echo -e "\t\033[0;33mWARNING:\033[0;39m\t$@"
}

error() {
  echo -e "\033[0;31mERROR:\033[0;39m\t$@" 1>&2
}

abort() {
  echo -e "\033[0;31mAbort:\033[0;39m"
  error "$@"
  exit 1 
}

ostype() {
  uname | tr "[:upper:]" "[:lower:]"
}


case "$(ostype)" in
  *'linux'*)    PLATFORM='linux' ;;
  *'darwin'*)   PLATFORM='osx' ;;
  *'bsd'*)      PLATFORM='bsd' ;;
  *)            PLATFORM='unknown' ;;
esac
