#!/bin/bash
set -e

echo "?? Checking backend..."
if [ ! -d "backend" ]; then
  echo "? Backend folder not found!"
  exit 1
fi
cd backend

if [ ! -f ".env" ]; then
  echo "? .env not found in backend!"
  exit 1
fi

if ! grep -q "DATABASE_URL" .env; then
  echo "? DATABASE_URL missing from .env!"
  exit 1
fi

echo "?? Installing backend dependencies..."
npm install

echo "?? Starting backend..."
node src/index.js &
BACKEND_PID=\$!
cd ..

echo "?? Checking web frontend..."
if [ ! -d "web" ]; then
  echo "? Web folder not found!"
  exit 1
fi
cd web
npm install
npm run build
npm run preview &
FRONTEND_PID=\$!
cd ..

wait \ \
