FROM node:18-alpine as builder
WORKDIR '/home/node/reactapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/node/reactapp/build /usr/share/nginx/html


