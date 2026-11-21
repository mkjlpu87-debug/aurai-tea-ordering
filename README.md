# Aurai Chauraha Tea & Snacks — Ordering + Admin

## Features
- Mobile customer ordering page with category filters, cart and customer details.
- GPS is requested only when customer taps **Use my location**. The order message includes a Google Maps pin link.
- WhatsApp order handoff with items, quantities, total, customer mobile and address.
- Admin panel: add/hide categories, add products, change prices, enable/disable and delete products.
- JSON data persistence for a small single-server MVP.

## Configure
Copy `.env.example` to `.env`, then set:
- `SHOP_WHATSAPP`: full international digits, e.g. `919876543210` (no plus or spaces)
- `ADMIN_PASSWORD`: strong password
- `SESSION_SECRET`: long random secret
- `SHOP_NAME`, `DELIVERY_TEXT` as needed

## Run on VPS
```bash
cp .env.example .env
# edit .env with real secrets
npm install --omit=dev
npm start
```
Open port 3000 behind Nginx/Caddy. Configure HTTPS; browser GPS requires HTTPS (except localhost). Use PM2 or systemd to keep Node running. Keep `.env` private and out of Git.

## Docker
```bash
docker build -t aurai-shop .
docker run -d --name aurai-shop --restart unless-stopped -p 3000:3000 --env-file .env -v aurai-shop-data:/data aurai-shop
```

## Important
- Orders open WhatsApp for customer review/send; this is not automated WhatsApp Business API delivery and does not save an order record.
- Shop must confirm order, stock, delivery area and delivery charges.
- JSON storage is intended for a single instance. For multi-instance/production scale, use PostgreSQL and backups.
- Change the default admin username/password before public deployment. Use HTTPS, firewall, backups and a strong unique `SESSION_SECRET`.
