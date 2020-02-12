# intro
According to some customerize fire wall rule need to be elastic in nginx

here comes to have some work

# quick start
> docker run --name="openresty_nginx" -p 8080:80 -v $PWD/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro -d openresty/openresty:1.9.15.1-trusty


# refer:
- https://lua.ren/topic/338/