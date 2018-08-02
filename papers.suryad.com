server {
	listen 80;
	listen [::]:80;

root /var/www/papers.suryad.com/html;

	index index.html index.htm index.nginx-debian.html;

server_name papers.suryad.com www.papers.suryad.com;
	
	location / {
		try_files $uri $uri/ =404;
	}

}
