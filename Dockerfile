FROM node:16-alpine

WORKDIR /work

RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn \
      gettext \
      bash

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

RUN npm install -g aws-azure-login@3.4.0

RUN mkdir /root/.aws

COPY src/config.tpl config.tpl

COPY src/docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]