# tag this phase with name builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build contains the build files

FROM nginx
# copy folder from first container to nginx folder it uses to serve files
COPY --from=builder /app/build /usr/share/nginx/html
# RUN command is not needed because the default command is to start nginx