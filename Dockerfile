# SLH Dockerfile
FROM node:20-slim
WORKDIR /app
COPY backend/package.json backend/package-lock.json* ./backend/
WORKDIR /app/backend
RUN npm ci --omit=dev
COPY backend/ .
CMD [""node"", ""src/index.js""]
