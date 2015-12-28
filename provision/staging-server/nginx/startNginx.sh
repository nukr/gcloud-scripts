docker run -d \
       -p 80:80 \
       --name nginx \
       --link dal:dal \
       -v /home/wei/nginx/conf.d:/etc/nginx/conf.d \
       -v /home/wei/nginx/log:/var/log/nginx \
       nginx
