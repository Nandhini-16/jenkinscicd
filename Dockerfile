# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application source code to the working directory
COPY . .

# Specify the internal and external ports
ENV INTERNAL_PORT=3000
ENV EXTERNAL_PORT=8080

# Expose the internal port
EXPOSE $INTERNAL_PORT

# Start the Node.js application
CMD ["node", "index.js"]

