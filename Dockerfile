FROM node:20-slim

WORKDIR /app

COPY backend/package.json backend/package-lock.json* ./backend/
COPY web/package.json web/package-lock.json* ./web/

RUN cd backend && npm install --omit=dev
RUN cd web && npm install --omit=dev

COPY . .

EXPOSE 3000 5173

CMD sh start.sh
