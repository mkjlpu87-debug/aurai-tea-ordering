FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
ENV NODE_ENV=production DATA_DIR=/data
RUN mkdir -p /data
VOLUME ["/data"]
EXPOSE 3000
CMD ["npm","start"]
