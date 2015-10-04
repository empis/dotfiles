err() {
  echo "$1"
  exit 1
}

usage() {
  echo "usage: fan [option]"
  echo
  echo "Options:"
  echo "     off - Fan off"
  echo "     low - Fan at low speed"
  echo "     medium   - Fan at medium speed"
  echo "     maximum, max   - Fan at maximum speed"
  echo "     auto, default   - Fan at automatic mode"
  echo "     disengaged   - Disengaged"
  echo "     -h, --help     - display this"
  exit
}

#Argument Parsing
case "$1" in
	'off')
		echo level 0 | sudo tee /proc/acpi/ibm/fan
	;;
	'low')
		echo level 2 | sudo tee /proc/acpi/ibm/fan
	;;
	'medium')
		echo level 4 | sudo tee /proc/acpi/ibm/fan
	;;
	'maximum'|'max')
		echo level 7 | sudo tee /proc/acpi/ibm/fan
	;;
        'auto'|'default')
                echo level auto | sudo tee /proc/acpi/ibm/fan
        ;;
        'disengaged')
                echo level disengaged | sudo tee /proc/acpi/ibm/fan
        ;;
	''|'-h'|'--help')
		usage
	;;
	*)
		err "Unrecognized option \`$1', see fan --help"
	;;
esac
