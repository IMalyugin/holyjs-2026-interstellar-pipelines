for arg in "$@"; do
  echo "$arg" >> "/var/lib/ci-env/.env"
done
