FROM 3dpro/openssh
ADD build-files /build-files
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/11proxy && \
    wget -qO- https://deb.nodesource.com/setup_7.x | bash - && \
    sudo apt-key adv --fetch-keys http://dl.yarnpkg.com/debian/pubkey.gpg && \
    echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn git && \
    mv /build-files/authorized_keys /root/.ssh/authorized_keys && \
    mv /build-files/start.sh /start.sh && \
    mv /build-files/firstrun.sh /firstrun.sh && \
    npm install pm2 --global && \
    mkdir /opt/app && \
    mv /build-files/app.js /opt/app/app.js && \
    mv /build-files/process.yml /opt/app/process.yml && \
    cd /opt/app && yarn add express && \
    chmod 600 /root/.ssh/authorized_keys && \
    chown root:root /start.sh && \
    chmod 700 /start.sh && \
    chmod root:root /firstrun.sh && \
    chmod 700 /firstrun.sh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /build-files /etc/apt/apt.conf.d/11proxy

CMD ["/start.sh"]

# Expose port
EXPOSE 3000
