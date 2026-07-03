FROM            docker.io/redhat/ubi9 
RUN             dnf module disable nginx -y && \
                dnf module enable nginx:1.24 -y && \
                dnf install -y nginx && \
                dnf clean all && \
                rm -rf /usr/share/nginx/html/*
ADD             ./ /usr/share/nginx/html/
COPY            ./nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT      ["/usr/sbin/nginx", "-g", "daemon off;"]
# This will be executed as a root user. But using securit context at podlelve, we wll enforce to run it as non-root user