error() {
  echo -e "\033[0;31m$1\033[0m" >&2
  exit 1
}
