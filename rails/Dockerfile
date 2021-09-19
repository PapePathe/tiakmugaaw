FROM ruby:3.0.2-alpine

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN bundle config --global frozen 1

WORKDIR /opt/tmg/

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

COPY . .

EXPOSE $RAILS_PORT
ENTRYPOINT ["./entrypoint.sh"]
