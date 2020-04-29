FROM node:10-slim

# Install Puppeteer dependencies: https://github.com/GoogleChrome/puppeteer/blob/master/docs/troubleshooting.md#chrome-headless-doesnt-launch
RUN apt-get update \
   && apt-get --no-install-recommends install -y \
   gconf-service \
   libasound2 \
   libatk1.0-0 \
   libc6 \
   libcairo2 \
   libcups2 \
   libdbus-1-3 \
   libexpat1 \
   libfontconfig1 \
   libgcc1 \
   libgconf-2-4 \
   libgdk-pixbuf2.0-0 \
   libglib2.0-0 \
   libgtk-3-0 \
   libnspr4 \
   libpango-1.0-0 \
   libpangocairo-1.0-0 \
   libstdc++6 \
   libx11-6 \
   libx11-xcb1 \
   libxcb1 \
   libxcomposite1 \
   libxcursor1 \
   libxdamage1 \
   libxext6 \
   libxfixes3 \
   libxi6 \
   libxrandr2 \
   libxrender1 \
   libxss1 \
   libxtst6 \
   ca-certificates \
   fonts-liberation \
   libappindicator1 \
   libnss3 \
   lsb-release \
   xdg-utils \
   wget \
   python3 \
   python3-pip \
   python3-setuptools \
   groff \
   gettext-base \
   && pip3 install --upgrade pip \
   && pip --no-cache-dir install awscli \
   && apt-get -q -y clean \
   && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*


RUN npm install -g aws-azure-login --unsafe-perm


COPY src/config.tpl config.tpl
RUN mkdir /root/.aws
RUN mkdir /work/


COPY src/docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh


ENTRYPOINT ["/bin/docker-entrypoint.sh"]