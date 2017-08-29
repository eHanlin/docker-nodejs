
FROM node:8
 
MAINTAINER sparrow.jang <sparrow.jang@gmail.com>
ENV HOME=/root SERVICE_TAGS=nodejs
COPY run-war.sh ${HOME}/run-war.sh
Run rm -rf /var/lib/apt/lists/* -vf
Run apt-get clean
Run apt-get autoremove
Run apt-get update
Run apt-get install -y zip jq locales tar
RUN sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && locale-gen
RUN sed -i 's/^# *\(zh_TW.UTF-8\)/\1/' /etc/locale.gen && locale-gen
RUN update-locale
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN chmod +x ${HOME}/run-war.sh
EXPOSE 8080
 
ENTRYPOINT ["/root/run-war.sh"]

