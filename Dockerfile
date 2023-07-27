FROM ruby:3.2.1
RUN apt-get update -qq \
  && apt-get install -y \
  # Needed for certain gems
  build-essential \
  # Needed for postgres gem
  libpq-dev \
  # Others
  nodejs \
  vim-tiny \
  # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
  /var/lib/apt \
  /var/lib/dpkg \
  /var/lib/cache \
  /var/lib/log
## Changes localtime to Singapore
#RUN cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime
RUN mkdir /library-management
WORKDIR /library-management
COPY Gemfile /library-management/Gemfile
COPY Gemfile.lock /library-management/Gemfile.lock
RUN bundle install
ADD . /library-management
CMD bash -c "rm -f tmp/pids/server.pid && rails s -p 3000 -b '0.0.0.0'"
