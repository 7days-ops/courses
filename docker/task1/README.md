docker build -t custom_nginx .
docker run -d -p 8080:80 --name my_nginx custom_nginx
