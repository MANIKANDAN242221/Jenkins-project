# Use official Node LTS image
FROM node:20-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package files first (for caching npm install)
COPY package.json package-lock.json* ./

# Install dependencies (production only)
RUN npm install --production

# Copy entire project into container
COPY . .

# Expose port your app listens on
ENV PORT=3000
EXPOSE 3000

# Start your app (make sure package.json start script points to "node public/server.js")
CMD ["npm", "start"]
