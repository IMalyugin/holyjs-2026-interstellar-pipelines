# Реальный сниппет кода, который надо спрятать

# Было (Dockerfile)
ENV BUILDAH_FORMAT=docker
ENV BUILDAH_ISOLATION=chroot
RUN apk add --no-cache buildah netavark


# Стало (Dockerfile)
RUN ci-env install buildah

# Стало (install-buildah.sh)
ci-env BUILDAH_FORMAT=docker
ci-env BUILDAH_ISOLATION=chroot
apk add --no-cache buildah netavark

# Содержимое .env-файла:
# BUILDAH_FORMAT=docker
# BUILDAH_ISOLATION=chroot

# Для считывания переменных вызываем source .env
