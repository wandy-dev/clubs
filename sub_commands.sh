for file in $COMMAND_DIR/*.sh; do
  source $file
done

subcommand=$1
rootcommand=$(echo $COMMAND_DIR | sed 's/.\+_//')
shift "$((OPTIND-1))"

case $subcommand in
  *)
    for arg in "$@"; do
      shift
      ${rootcommand}_${subcommand} $@
      if [ $? = 127 ]; then
        error "Error: '$subcommand' is not a known command."
        exit 1
      fi
      shift
    done
  ;;
esac
