#!/bin/bash
set -e

echo "?? Starting backend..."
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

echo "?? Running backend..."
node src/index.js &
BACKEND_PID=\$!

cd ..

echo "?? Starting frontend..."
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
echo "? Waiting for backend and frontend processes..."
wait \ \

