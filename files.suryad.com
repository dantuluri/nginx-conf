server {
	listen 80;
	listen [::]:80;

root /var/www/files.suryad.com/html;

	index index.html index.htm index.nginx-debian.html;

server_name files.suryad.com www.files.suryad.com;
	
 location / {
proxy_pass http://localhost:8070;
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host $host;
proxy_cache_bypass $http_upgrade;
}
}
