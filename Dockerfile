# build docker image
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build
# run the docker image in nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80