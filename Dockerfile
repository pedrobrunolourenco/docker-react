FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# docker run -p 8080:80 72a28b2190a3


