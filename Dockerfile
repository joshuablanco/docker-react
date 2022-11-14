# todo lo que este aca va a ser referenciada como builder phase 
# Notar que en este punto no importa el volumen porque se necesitaba la modificacion del codigo durante la etapa de dev, en este caso unicamente 

FROM node:16-alpine as builder
USER node

RUN mkdir -p /home/node/app 
WORKDIR /home/node/app

COPY --chown=node:node ./package.json ./
RUN npm install

COPY --chown=node:node ./ ./
RUN npm run build

## Run Phase
FROM nginx
EXPOSE 80
COPY --from=builder /home/node/app/build /usr/share/nginx/html
