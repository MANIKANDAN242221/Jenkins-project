# Use official Node LTS image
FROM node:20-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files first (better caching)
COPY package.json package-lock.json* ./

# Install dependencies (production only)
RUN npm install --production

# Copy app source, including the 'public' folder where server.js lives
COPY public/ ./public

# If you have other files/folders needed, copy them too, e.g.:
# COPY other-folder/ ./other-folder

# Set environment variables
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the app with the correct path to server.js
CMD ["node", "public/server.js"]
