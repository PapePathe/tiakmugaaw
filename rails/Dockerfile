FROM ruby:3.0.2-alpine

RUN apk add --no-cache build-base=0.5-r2 postgresql-dev=13.4-r0 postgresql-client=13.4-r0

WORKDIR /opt/tmg/

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.23 && bundle install

COPY . .

EXPOSE $RAILS_PORT

CMD bundle exec rails s -b 0.0.0.0 -p 2722
#ENTRYPOINT ["./bin/entrypoint"]
