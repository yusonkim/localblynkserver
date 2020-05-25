# FROM mpherg/blynk-server:0.41.10
FROM linuxkonsult/rasbian-blynk:latest

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV SERVER_PROFILE_PATH /config/server.properties

# copy server settings including admin password
COPY server.properties ${SERVER_PROFILE_PATH}
COPY entrypoint.sh /usr/local/bin

# # copy ssl certification
# ENV DATA_FOLDER /data
# RUN mkdir ${DATA_FOLDER}/certification
# COPY ./certification/* ${DATA_FOLDER}/certification/

ENTRYPOINT ["entrypoint.sh"]