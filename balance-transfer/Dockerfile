# --- Base Node ---
FROM node:6.11.5 AS base
RUN mkdir -p /var/www
RUN mkdir -p /var/log/chain-service
RUN mkdir /root/.hfc-key-store
ADD package.json /var/www
# we only need the keys (not the PeerAdmin file) but dump it anyway
# apparently fabric-client uses these folder to fetch the keys when verifying signing identity from PeerAdmin object
# ADD hlf/creds /root/.hfc-key-store

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:

# --- Dependencies ---
FROM base AS dependencies
COPY . /tmp/
RUN cd /tmp && npm install --only=production && npm rebuild grpc --force
RUN cp -R /tmp/node_modules /tmp/prod_node_modules
RUN cd /tmp && npm install

# --- Build ---
FROM dependencies AS build
COPY ./src /tmp/src
RUN cd /tmp && npm run build

# --- Release ---
FROM base AS release
WORKDIR /var/www
# create empty .env file for dotenv lib
RUN touch .env
COPY --from=dependencies /tmp/prod_node_modules ./node_modules
COPY --from=build /tmp/dist ./dist
# Default port is 4000
VOLUME /var/log/chain-service
EXPOSE 4000
CMD [ "npm", "run", "serve-aws" ]





