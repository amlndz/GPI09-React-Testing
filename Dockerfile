# Etapa 1: Build con Node 14
FROM node:14 AS builder

RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN npm install --legacy-peer-deps
RUN npm run build

# Etapa 2: Servidor con serve
FROM node:14
WORKDIR /app
RUN npm install -g serve
COPY --from=builder /app/build ./build
EXPOSE 3000
CMD ["serve", "-s", "build", "-l", "3000"]

