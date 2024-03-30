# Use the official Node.js 20 image.
# https://hub.docker.com/_/node
FROM node:20
# Create and change to the app directory.
WORKDIR /usr/src/app
# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND yarn.lock are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package.json ./
COPY yarn.lock ./
# Install production dependencies.
RUN yarn
# Copy local code to the container image.
COPY . .
# Run the web service on container startup.
CMD [ "yarn", "run", "express:start" ]
