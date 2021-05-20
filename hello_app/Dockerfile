FROM ruby:2.7.3

RUN gem install bundler:2.2.17 solargraph -N

# Clean up
RUN apt-get autoremove -y \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get -y install git nodejs \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn

ENV SHELL /bin/bash
