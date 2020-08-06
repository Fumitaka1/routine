FROM ruby:2.6.6-slim

RUN apt update -qq && apt install -y \
    build-essential \
    libmariadb-dev \
    libmagick++-6.q16-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /routine \
 && mkdir /routine/tmp \
 && mkdir /routine/tmp/sockets \
 && mkdir /routine/tmp/pids \
 && mkdir /routine/log

WORKDIR /routine

COPY Gemfile /routine/Gemfile
COPY Gemfile.lock /routine/Gemfile.lock

RUN gem install bundler:2.1.4 \
 && bundle install --without test development \
 && apt purge -y build-essential \
 && apt autoremove -y

COPY . /routine

EXPOSE 3000

CMD ["unicorn", "-E", "production", "-p", "3000"]
