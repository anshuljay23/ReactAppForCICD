# Stage 1: Build React app
FROM node:16-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the app
RUN npm run build

# Stage 2: Serve the React app using nginx
FROM nginx:alpine

# Copy the build output to the nginx HTML folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that the app will run on
EXPOSE 90

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
