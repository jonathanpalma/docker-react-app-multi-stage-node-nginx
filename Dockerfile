FROM node:carbon-alpine as build-stage
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --verbose
COPY . ./
RUN npm run build --verbose

FROM nginx:1.15.4-alpine
COPY --from=build-stage /usr/src/app/build /var/www
COPY --from=build-stage /usr/src/app/server/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]
