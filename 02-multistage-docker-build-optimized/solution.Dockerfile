# base-images:runtime
FROM node:24 as runtime

# runtime-модули переиспользутся как в final, так и в builder-сборках
COPY package.json yarn.lock ./
RUN yarn install --production

# base-images:builder
FROM runtime as builder

COPY . .
RUN yarn install # доустановка dev-модулей поверх runtime
RUN yarn build

# final-image
FROM runtime
COPY --from=builder dist dist
