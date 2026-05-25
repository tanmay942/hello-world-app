# Use official Node.js LTS image as base
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy application source code
COPY app.js .

# Expose the port the app listens on
EXPOSE 3000

# Define environment variable
ENV PORT=3000

# Run the application
CMD ["node", "app.js"]
