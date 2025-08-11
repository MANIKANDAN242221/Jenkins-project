# Use official Node LTS image
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files first (better caching)
COPY package.json package-lock.json* ./

# Install dependencies (production only)
RUN npm install --production

# Copy app source (make sure server.js is here)
COPY . .

# Set environment variables
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
