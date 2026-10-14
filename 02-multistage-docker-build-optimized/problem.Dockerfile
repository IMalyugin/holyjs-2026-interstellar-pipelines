# base-image
FROM node:24 as builder

RUN yarn install # тут происходит установка runtime & dev модулей
RUN yarn build

# final-image
FROM node:24

COPY package.json yarn.lock ./
RUN yarn install --production # runtime модули дублируются

COPY --from=builder build build

