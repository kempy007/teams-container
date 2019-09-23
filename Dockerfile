# Teams Insider Build
FROM debian

ADD http://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/teams-insiders_1.2.00.26154_amd64.deb /teams-insiders_1.2.00.26154_amd64.deb
ADD http://ftp.br.debian.org/debian/pool/main/libg/libgnome-keyring/libgnome-keyring-common_3.12.0-1_all.deb /libgnome-keyring-common_3.12.0-1_all.deb
ADD http://ftp.br.debian.org/debian/pool/main/libg/libgnome-keyring/libgnome-keyring0_3.12.0-1+b2_amd64.deb /libgnome-keyring0_3.12.0-1+b2_amd64.deb

RUN \ 
 DEBIAN_FRONTEND=noninteractive && \
 apt update && \
 apt install -y wget bash libasound2 libatk-bridge2.0-0 libatk1.0-0 libcairo2 libcups2 libexpat1 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0  libpangocairo-1.0-0 libsecret-1-0 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6  libxkbfile1 libxrandr2 libxrender1 libxss1 libxtst6 libsecret-1-0 gnome-keyring libfontconfig1 libdbus-1-3 && \
 dpkg -i /libgnome-keyring-common_3.12.0-1_all.deb && \
 dpkg -i /libgnome-keyring0_3.12.0-1+b2_amd64.deb && \
 dpkg -i /teams-insiders_1.2.00.26154_amd64.deb && \
 rm -rf *.deb && \
 rm -rf /var/lib/apt/lists/* && \
 echo "build complete"

CMD ["teams-insiders"] # miss fires

# podman run --rm -it --name teams0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY localhost/msteams bash
# bash -c /usr/bin/teams-insiders
