# Development stage
FROM node:18.18-bookworm-slim

# Directory
WORKDIR /app

# Install all dependencies
COPY package*.json /app/
RUN npm install


COPY . /app

# Copy files
EXPOSE 5000

CMD ["npm", "start"]
