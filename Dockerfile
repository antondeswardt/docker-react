# Specify base image first
FROM node:alpine

# Specify working directory in image
WORKDIR '/app'

# Setup dependencies
COPY package.json .
RUN npm install
COPY . .

# Expose port 80
EXPOSE 80

# Specify starting command for running container
CMD ["npm", "run", "start"]
