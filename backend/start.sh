#!/bin/bash
set -e
echo "🚀 Starting backend..."
cd backend
if [ -f .env ]; then
  export \
fi
node src/index.js &
BACKEND_PID=\$!

echo "🚀 Starting web frontend..."
cd ../web
npm install
npm run build
npm run preview &
FRONTEND_PID=\$!

wait \ \
