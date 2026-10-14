# Если нужно обернуть не команду а несколько строчек кода
ci-section() {
  GLS_ID="${RANDOM}${RANDOM}"
  GLS_STACK="${GLS_STACK:-} $GLS_ID"
  echo -en "section_start:$(date +%s):my-alias-${GLS_ID}\r\e[0K" >&2;
  echo -en "\e[36m" >&2;
  echo -en "$*" >&2;
  echo -e "\e[0m" >&2;
}

ci-endsection() {
  set -- $GLS_STACK
  LAST_ID=${!#}
  GLS_STACK=${GLS_STACK% *}
  echo -e "section_end:$(date +%s):my-alias-${LAST_ID}\r\e[0K"
}
