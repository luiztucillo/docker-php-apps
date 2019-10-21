FROM nginx:latest

ARG app_path
ENV APP_PATH=$app_path

ARG username
ENV USERNAME=$username

ARG domain
ENV DOMAIN=$domain

#set folder owner
RUN mkdir -p $APP_PATH
RUN useradd -m $USERNAME
RUN chown -R $USERNAME:$USERNAME $APP_PATH

# Make sure the volume mount point is empty
RUN rm -rf $APP_PATH/*

COPY conf/nginx.conf /etc/nginx/
RUN echo "set \$domain $USERNAME;\nset \$app_path $APP_PATH;\nset \$domain $DOMAIN;" > /etc/nginx/var.conf
RUN echo "user $USERNAME;\n$(cat /etc/nginx/nginx.conf)" > /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf
