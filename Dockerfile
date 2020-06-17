FROM alpine

ENV USER "user"
ENV TESTDIR /tests

RUN apk add nodejs npm chromium bash curl
RUN npm install puppeteer
RUN adduser -s /bin/bash -g users --disabled-password $USER 
RUN mkdir -p $TESTDIR 

#VOLUME $TESTDIR 

COPY ./examples/test.js $TESTDIR 
RUN chown -R $USER:users $TESTDIR && ls -hal $TESTDIR 

USER $USER 

ENTRYPOINT cd $TESTDIR && node test.js
