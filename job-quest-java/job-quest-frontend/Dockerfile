# Stage 1: Build React/Vite app
FROM node:20-alpine AS build
WORKDIR /app

# Copy package files & install deps
COPY package*.json ./
RUN npm install

# Cho phép truyền biến môi trường khi build
#Đổi tên biến
ARG VITE_API_URL
ENV VITE_API_URL=${VITE_API_URL}

# Copy code vào container
COPY . .

# Build production
RUN npm run build

# Stage 2: Serve bằng Nginx
FROM nginx:alpine

# Copy build từ Vite (thư mục 'dist')
COPY --from=build /app/dist /usr/share/nginx/html

# Script để thay thế runtime
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && ls -l /

# Expose cổng 80
EXPOSE 80
# Dùng entrypoint để thay thế runtime
ENTRYPOINT ["/docker-entrypoint.sh"]
# Run nginx
CMD ["nginx", "-g", "daemon off;"]

# Lưu ý: Nếu bạn sử dụng Docker trên Windows và muốn truy cập backend trên máy host,
# bạn có thể cần sử dụng "host.docker.internal" thay vì "localhost" trong axiosConfig.js.
# Ví dụ: baseURL: "http://host.docker.internal:8080"
# Điều này cho phép container frontend truy cập backend đang chạy trên máy host.