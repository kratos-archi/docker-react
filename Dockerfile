FROM node:12-alpine3.12 as builder
USER root
WORKDIR '/app'
COPY package.json .

RUN npm install

COPY . . 

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html