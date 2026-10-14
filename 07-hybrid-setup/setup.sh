if [[ -n "${GITLAB_CI:-}" ]]; then
  echo -e "Setup helpers\e[30m" >&2
  echo -e "#\e[31m Error: ci-tools setup must be piped to eval\e[30m"
  echo -e "#\e[31m Run:\e[30m"
  echo -e "#\e[31m   eval \$(ci-tools setup ...args)\e[30m"
  echo    "source $(import_path ci-helpers/core.sh)"
  echo    "source $(import_path ci-helpers/aliases.sh)"
  echo    "source $(import_path ci-helpers/gates.sh)"
  echo    "source $(import_path ci-helpers/log.sh)"
  echo -e "\e[0m" >&2
fi
