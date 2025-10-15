#!/bin/sh
# Thay thế placeholder bằng biến môi trường thực
echo "🔧 Replacing API URL with: ${VITE_API_URL}"

# Thay thế trong env-config.js 
sed -i "s|__API_URL_PLACEHOLDER__|${VITE_API_URL}|g" /usr/share/nginx/html/env-config.js

echo "API URL replaced successfully"
# Debug: In ra nội dung để kiểm tra
echo "📄 env-config.js content:"
cat /usr/share/nginx/html/env-config.js

# Chạy nginx
exec "$@"