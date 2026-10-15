ARG FROM=harbor.domain/common/b2c/node:24-runtime

# ------------------------------------------------
# Минимальная основа для запуска nodejs-приложения
FROM $FROM AS runtime

RUN ci-tools setup --from=/home/host/ci
RUN ci-tools copy --chown=node:node . .
RUN ci-lifecycle install --runtime


# -------------------------------------------------
# Репозиторий + модули для запуска сборки
FROM $FROM AS builder

COPY --chown=node:node . .
RUN ci-lifecycle install
RUN ci-tools copy --exclude=.yarn-tarball.tgz ../cache ../cache
RUN ci-tools install buildah
RUN ci-tools buildah restore --additional
VOLUME /var/lib/containers/storage


# -------------------------------------------------------------
# Сборка финального backend-образа
FROM runtime as backend-runtime

RUN ci-lifecycle prepare
USER node

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["ci-lifecycle deploy"]


# -------------------------------------------------------------
# Сборка финального nginx-fe-образа
FROM docker.io/library/nginx:latest as nginx-runtime

COPY "packages/$APPLICATION/build/"  /usr/share/nginx/$APPLICATION
COPY nginx.conf /etc/nginx/nginx.conf
