FROM ruby:3.0.2-alpine

RUN apk add --no-cache build-base postgresql-dev postgresql-client
RUN bundle config --global frozen 0

WORKDIR /opt/tmg/

COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install

COPY . .

EXPOSE $RAILS_PORT

CMD bundle exec rails s -b 0.0.0.0 -p 2722
#ENTRYPOINT ["./bin/entrypoint"]
