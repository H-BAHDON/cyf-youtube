# Use the official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy both package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install --only=prod --no-progress --loglevel=error

# Copy the entire backend code to the working directory
COPY . .

# Expose the port on which your backend runs
EXPOSE 5000

# Command to run your application
CMD ["npm", "start"]
