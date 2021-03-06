# パッケージのインストールを行う
FROM node:17.4.0-alpine AS build
WORKDIR /build
COPY . .
ARG NEXT_PUBLIC_AUTHORIZER_URL
ARG NEXT_PUBLIC_CLIENT_ID
ARG NEXT_PUBLIC_REDIRECT_URL
RUN yarn install
RUN yarn build

# ビルド成果物をコピーし、サーバーを起動
FROM node:17.4.0-alpine AS production
ENV NODE_ENV=production
WORKDIR /app

# ビルド成果物のみをコピーしてやる
COPY --from=build /build/package.json /build/yarn.lock ./
COPY --from=build /build/.next ./.next
COPY --from=build /build/public ./public
# node_modules以下がこのイメージにないので、next.jsのサーバーを動かすために必要
RUN yarn add next

CMD ["yarn", "start"]
