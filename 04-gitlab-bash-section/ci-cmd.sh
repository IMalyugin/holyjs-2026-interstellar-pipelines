# Секция в gitlab с таймером времени
ci-cmd() {
  ID="${RANDOM}"

  echo -en "section_start:$(date +%s):${ID}\r\e[0K" >&2;
  echo -en "\e[33m" >&2;
  echo -en "[CMD] $*" >&2;
  echo -e "\e[0m" >&2;
  eval "$*";
  echo -e "section_end:$(date +%s):${ID}\r\e[0K" >&2;
}

# Секция в gitlab схлопнутая по умолчанию
ci-ccmd() {
  ID="${RANDOM}"

  echo -en "section_start:$(date +%s):${ID}[collapsed=true]\r\e[0K" >&2;
  echo -en "\e[33m" >&2;
  echo -en "[CMD] $*" >&2;
  echo -e "\e[0m" >&2;
  eval "$*";
  echo -e "section_end:$(date +%s):${ID}\r\e[0K" >&2;
}
