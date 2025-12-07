#!/bin/bash
set -e

echo "?? Starting backend..."
if [ -d "backend" ]; then
  cd backend
  if [ -f .env ]; then
    echo "? Loading .env (Node.js dotenv will handle it)"
  fi
  node src/index.js &
  BACKEND_PID=\$!
  cd ..
else
  echo "? Backend folder not found!"
fi

echo "?? Starting web frontend..."
if [ -d "web" ]; then
  cd web
  npm install
  npm run build
  npm run preview &
  FRONTEND_PID=\$!
  cd ..
else
  echo "? Web folder not found!"
fi

wait \ \
