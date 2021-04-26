# See https://catalog.redhat.com/software/containers/rhel8/nginx-116/5d400ae7bed8bd3809910782
FROM registry.redhat.io/rhel8/nginx-116
ADD nginx.conf "${NGINX_CONF_PATH}"
EXPOSE 8080
CMD nginx -g "daemon off;"
