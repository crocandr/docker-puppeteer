FROM alpine

ENV USER "puppeteer"
ENV TESTDIR /tests

# install packages
RUN apk add nodejs yarn chromium bash curl

# install puppeteer
#  npm install - idealTree exists bug
#RUN npm install puppeteer
#  yarn solve this
RUN yarn add puppeteer

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

