#!/bin/sh
# Thay thế placeholder bằng biến môi trường thực
echo "🔧 Replacing API URL with: ${VITE_API_URL}"

# Thay thế placeholder bằng biến môi trường thực
find /usr/share/nginx/html -type f -name "*.js" -exec sed -i "s|__API_URL_PLACEHOLDER__|${VITE_API_URL}|g" {} \;

echo "API URL replaced successfully"
# Chạy nginx
exec "$@"