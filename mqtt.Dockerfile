FROM eclipse-mosquitto

ARG MOSQUITTO_USER
ARG MOSQUITTO_PASSWORD

ENV MOSQUITTO_USER=${MOSQUITTO_USER}
ENV MOSQUITTO_PASSWORD=${MOSQUITTO_PASSWORD}

WORKDIR /mosquitto/config/

COPY --chmod=0700 pwfile pwfile
COPY mosquitto.conf mosquitto.conf

RUN echo "$MOSQUITTO_USER:$MOSQUITTO_PASSWORD" > /mosquitto/config/pwfile
RUN mosquitto_passwd -U /mosquitto/config/pwfile

EXPOSE 1883 8883 9001

CMD ["mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
