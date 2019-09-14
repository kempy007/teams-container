FROM ubuntu

RUN \
 wget http://packages.microsoft.com/repos/ms-teams/pool/main/t/teams-insiders/teams-insiders_1.2.00.24756_amd64.deb && \
 dpkg -i teams-insiders_1.2.00.24756_amd64.deb && \
 rm teams-insiders_1.2.00.24756_amd64.deb && \
 echo "Docker build complete"
 
CMD ["bash"]
