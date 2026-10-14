# base-image
FROM node:24 as builder

COPY . .
RUN yarn install
RUN yarn build

# final-image
FROM node:24

COPY package.json yarn.lock ./
RUN yarn install --production

COPY --from=builder dist dist

