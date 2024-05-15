ngrok_and_copy() {
  to_copy=0
  case "$1" in
    http|start|tcp|tunnel)
      if [ -n "$2" ]; then
        case "$2" in
          --help|-h|--metadata|--version|-v)
            to_copy=0
            ;;
          *)
            to_copy=1
            ;;
        esac
      else
        to_copy=1
      fi
  esac

  if [ $to_copy -eq 1 ]; then
    { sleep 2; ngrok-copy; } &
  fi

  ngrok "$@"
}

alias ngrok="ngrok_and_copy"
