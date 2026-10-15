### Реальный сниппет кода, который надо спрятать
#### Было (Dockerfile)
```dockerfile
ENV BUILDAH_FORMAT=docker
ENV BUILDAH_ISOLATION=chroot
RUN apk add --no-cache buildah netavark
```

#### Стало (Dockerfile)
```dockerfile
RUN ci-env install buildah
```

#### Стало (install-buildah.sh)
```shell
ci-env BUILDAH_FORMAT=docker
ci-env BUILDAH_ISOLATION=chroot
apk add --no-cache buildah netavark
```

#### Содержимое .env-файла:
```dotenv
BUILDAH_FORMAT=docker
BUILDAH_ISOLATION=chroot
```

Для считывания переменных вызываем source .env
