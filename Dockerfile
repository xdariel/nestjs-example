FROM node:22-alpine

WORKDIR /usr/src/app

COPY package*.json tsconfig*.json ./
RUN npm install

COPY src/ src/

RUN npm i -g rimraf

RUN npm run build
RUN npm i -g pm2

RUN  rm -r src

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

EXPOSE 4000

CMD [ "pm2-runtime", "dist/main.js" ]
