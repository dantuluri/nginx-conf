server {
	listen 80;
	listen [::]:80;

root /var/www/data.suryad.com/html;

	index index.html index.htm index.nginx-debian.html;

server_name data.suryad.com www.data.suryad.com;
	
 location / {
proxy_pass http://localhost:8882;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
}
}
