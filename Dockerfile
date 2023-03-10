FROM node:18-alpine as builder
WORKDIR '/home/node/reactapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /home/node/reactapp/build /usr/share/nginx/html


