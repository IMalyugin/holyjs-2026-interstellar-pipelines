# Same docker file used for all prebuild & build calls. Only arguments differ
#
# Prebuild (runtime)
# - uses default values
#
# Prebuild (builder)
# - uses BUILDER_BASE=base-images:runtime
#
# Build
# - uses RUNTIME_BASE=base-images:runtime
# -      BUILDER_BASE=base-images:builder
ARG RUNTIME_BASE=node:24-alpine
ARG BUILDER_BASE=runtime


# base-images:runtime
FROM $RUNTIME_BASE as runtime

COPY package.json yarn.lock ./
RUN yarn install --production


# base-images:builder
FROM $BUILDER_BASE as builder

COPY . .
RUN yarn install
RUN yarn build


# final-image
FROM runtime
COPY --from=builder dist dist
