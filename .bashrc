# .bashrc
# Fish
if [ -z "$FISH" ] && [ "${FISH:-A}" = "${FISH-A}" ]; then # if $FISH is undefined
  export FISH=1
fi
if [ $((FISH)) != 0 ]; then
    case $- in
        *i*) exec fish;;
        *) return;;
    esac
fi
