FROM node:16-alpine

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

WORKDIR /work

COPY src/config.tpl config.tpl
COPY src/docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN apk --no-cache update && \
    apk --no-cache add \
      python3 \
      python3-dev \
      py-pip \
      ca-certificates \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont \
      nodejs \
      yarn \
      gettext \
      bash && \
    pip3 --no-cache-dir install awscli virtualenv setuptools dnxsso boto3 && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    npm install -g aws-azure-login@3.4.0 && \
    mkdir /root/.aws && \
    chmod +x /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]