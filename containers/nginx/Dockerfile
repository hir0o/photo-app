FROM nginx:1.15
USER root
RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/karon.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf