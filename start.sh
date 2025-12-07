#!/bin/sh
cd backend
node src/index.js &
cd ../web
vite
