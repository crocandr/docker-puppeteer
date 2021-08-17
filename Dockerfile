FROM node:16-alpine

ENV USER "puppeteer"
ENV TESTDIR /tests

# install packages
RUN apk add nodejs npm chromium bash curl

# install puppeteer
# remove node_modules folder - idealTree problem fix for newer nodejs
RUN rm -rf /usr/local/lib/node_modules && \
    npm install puppeteer

# set user
RUN adduser -s /bin/bash -g users --disabled-password $USER

# create folder
RUN mkdir -p $TESTDIR

# copy a simple example
COPY ./examples/test.js $TESTDIR
# permission fix
RUN chown -R $USER:users $TESTDIR && ls -hal $TESTDIR

# change to user
USER $USER

ENTRYPOINT cd $TESTDIR && node test.js

