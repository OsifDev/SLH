#!/bin/bash

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Start backend
if [ -d "backend" ]; then
  echo "🚀 Starting backend..."
  cd backend
  npm install
  node src/index.js &
  BACKEND_PID=$!
  cd ..
else
  echo "? Backend folder not found!"
fi

# Start frontend
if [ -d "web" ]; then
  echo "🚀 Starting frontend..."
  cd web
  npm install
  npm run build
  npm run preview &
  FRONTEND_PID=$!
  cd ..
else
  echo "? Web folder not found!"
fi

wait $BACKEND_PID $FRONTEND_PID
