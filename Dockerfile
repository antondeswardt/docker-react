# Setup base image for builder phase
FROM node:alpine AS builder

# Specify working directory for builder phase
WORKDIR '/app'

# Setup Dependencies for builder phase
COPY package.json .
RUN npm install
COPY . .
RUN npm build

# After the above steps, /app/build
#  will have what we want

# Setup base image for next phase
FROM nginx:latest

# Expose port 80
EXPOSE 80

# Copy from previous phase
COPY --from=builder /app/build /usr/share/nginx/html

# Specify start command
# Not needed, the default for the nginx image will take care of for us, no RUN required
# CMD ["nginx"]
