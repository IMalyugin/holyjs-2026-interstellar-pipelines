# Достаточно добавить перед командой название helper-метода

# Было
buildah bud --tag "$TAG" "${ARGS[@]}" "${CONTEXT}"
yarn install --prefer-offline --frozen-lockfile --production

# Стало
ci-cmd buildah bud --tag "$TAG" "${ARGS[@]}" "${CONTEXT}"
ci-ccmd yarn install --prefer-offline --frozen-lockfile --production
