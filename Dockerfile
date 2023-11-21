FROM node:16.10.0 AS js

WORKDIR /app
COPY . .

RUN yarn install
RUN yarn build

FROM nginx

COPY --from=js /app/dist /app/dist

WORKDIR /app

COPY ./nginx.conf /config/nginx.conf

EXPOSE 7600

CMD ["nginx", "-c", "/config/nginx.conf"]
