FROM nginx:1.11-alpine

RUN apk add --no-cache git fcgiwrap spawn-fcgi

# configuration
COPY nginx.conf htpasswd /etc/nginx/

# configure git user and email
RUN git config --global user.email "foo@example.org" \
    && git config --global user.name "foo"

# repository containing stub package
WORKDIR /srv/git
COPY composer.json .
RUN git init . \
    && git commit --allow-empty -m 'Initial empty commit' \
    && git add composer.json \
    && git commit -m 'Add composer.json' \
    && git tag 1.0.0

CMD /bin/sh -c '/usr/bin/spawn-fcgi -s /var/run/fcgiwrap.socket /usr/bin/fcgiwrap && /usr/sbin/nginx -g "daemon off;"'
