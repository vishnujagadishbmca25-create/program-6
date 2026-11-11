# Stage 1 - Build Stage
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
COPY . .

# Stage 2 - Runtime Stage
FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 5000
CMD ["node", "index.js"]
