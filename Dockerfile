FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN apt-get update -qq && \
   apt-get install -y build-essential libpq-dev
# Node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g n yarn
RUN n 10.16.0

RUN mkdir /shoukaigame
WORKDIR /shoukaigame
COPY . /shoukaigame
RUN bundle install
RUN yarn install
