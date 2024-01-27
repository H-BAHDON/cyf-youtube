# Use the official Node.js image as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy both package.json and package-lock.json to the working directory
COPY ./package*.json ./

# Log the current directory content to check if package.json and package-lock.json are there
RUN ls -al

# Install application dependencies
RUN npm install --only=prod

# Copy the entire backend code to the working directory
COPY . .

# Log the current directory content again to check if the project files are there
RUN ls -al

# Expose the port on which your backend runs
EXPOSE 5000

# Command to run your application
CMD ["npm", "start"]
