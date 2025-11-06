#Stage 1 - Build stage
FROM node:18 AS build

#
WORKDIR /app

#
COPY package*.json ./
RUN npm install

# 
COPY . .

#Stage 2 - Runtime Stage
FROM node:18-slim

#
WORKDIR /app

#
COPY --from=build /app /app

#Expose the port
EXPOSE 3000

#
CMD ["node", "index.js"]

