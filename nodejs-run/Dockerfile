
FROM peter1209/nodejs
 
MAINTAINER peter.j <peter@ehanlin.com.tw>
ENV HOME=/root SERVICE_TAGS=nodejs
COPY run-war.sh ${HOME}/run-war.sh
RUN chmod +x ${HOME}/run-war.sh
EXPOSE 8080
 
ENTRYPOINT ["/root/run-war.sh"]

