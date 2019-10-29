FROM nginx:latest

ARG username
ENV USERNAME=$username

ARG domain
ENV DOMAIN=$domain

#set folder owner
RUN mkdir -p /var/www/html
RUN useradd -m $USERNAME
RUN chown -R $USERNAME:$USERNAME /var/www/html

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*

COPY conf/nginx.conf /etc/nginx/
RUN echo "set \$domain $USERNAME;\nset \$domain $DOMAIN;" > /etc/nginx/var.conf
RUN echo "user $USERNAME;\n$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf
