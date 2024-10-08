# Use an official Node.js image as a parent image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app for production
RUN npm run build

# Install a simple HTTP server to serve the React app
RUN npm install -g serve

# Expose the application port (Change to port 90)
EXPOSE 90

# Command to start the app using "serve" and set it to port 90
CMD ["serve", "-s", "build", "-l", "90"]
