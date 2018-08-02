server {
	listen 80;
	listen [::]:80;


	root /var/www/py.suryad.com/files;


	server_name tf.suryad.com www.tf.suryad.com;
	
	location / {
	    proxy_http_version 1.1;
	    proxy_pass http://127.0.0.1:6006;
	  }

}


