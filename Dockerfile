# BUILD phase
FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

# We used Docker Volumes to copy over files in docker-compose... OPTIONAL
COPY . .

RUN yarn build

# RUN phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
# nginx starts by default