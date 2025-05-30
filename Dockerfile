# Stage 1: Build the frontend app
FROM node:18 AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build   # generates the build/ folder

# Stage 2: Serve with NGINX
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html









# FROM node:18

# WORKDIR /app
# COPY . .
# RUN npm install

# EXPOSE 3000
# CMD ["npm", "start"]
