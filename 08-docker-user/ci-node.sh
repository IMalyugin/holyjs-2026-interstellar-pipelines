# Если текущий процесс запущен от пользователя "node", то выполняем код hook_file
# В ином случае, запускаем hook_file от пользователя "node"

hook_file="path/script-to-run.sh"

if [ "$(id -un)" = "node" ]; then
  # node: run normally
  bash -c "$hook_file ${ARGS[*]}"
else
  # root: switch to node user
  su node -c "$hook_file ${ARGS[*]}"
fi

