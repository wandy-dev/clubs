BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

cprint() {
  case $1 in
    black) color=$BLACK;;
    red) color=$RED;;
    green) color=$GREEN;;
    yellow) color=$YELLOW;;
    blue) color=$BLUE;;
    purple) color=$PURPLE;;
    cyan) color=$CYAN;;
    white) color=$WHITE;;
  esac

  echo -e "$color$2${NC}"
}
