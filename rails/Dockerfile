#FROM ruby:3.0.2-alpine as builder
#ENV LANG=C.UTF-8
#ENV TZ=Africa/Dakar
#RUN apk update && \
#    apk upgrade && \
#    apk add --no-cache \
#        postgresql-client=13.4-r0 \
#        postgresql-dev=13.4-r0 \
#        tzdata \
#        yarn && \
#    apk add --virtual build-packs --no-cache \
#        build-base=0.5-r2 \
#        curl-dev
#WORKDIR /opt/tmg/
#COPY Gemfile Gemfile.lock ./
#RUN gem install bundler:2.2.23 && bundle install
#RUN apk del build-packs
#
#FROM ruby:2.5.5-alpine
#COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
#COPY . .
#EXPOSE $TMG_APP_PORT
#CMD bundle exec rails s -p $TMG_APP_PORT -b 0.0.0.0

FROM ruby:3.0.2-alpine as builder

RUN apk update && apk upgrade
RUN apk add --update build-base alpine-sdk postgresql-client=13.4-r0 postgresql-dev=13.4-r0 tzdata nodejs yarn tzdata && rm -rf /var/cache/apk/*

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
#ENV RAILS_ENV=production
#ENV SECRET_KEY_BASE mykey
RUN gem install bundler:2.2.23 && bundle install --deployment --jobs=4
#COPY package.json yarn.lock $APP_HOME/
#RUN yarn install  --check-files
COPY . $APP_HOME
RUN bundle exec rake assets:precompile
RUN rm -rf $APP_HOME/node_modules && rm -rf $APP_HOME/tmp/*

FROM ruby:3.0.2-alpine
RUN apk update && apk add --update postgresql-client=13.4-r0 postgresql-dev=13.4-r0 && rm -rf /var/cache/apk/*

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY --from=builder /app $APP_HOME
#ENV RAILS_ENV=production
#ENV SECRET_KEY_BASE mykey
RUN bundle config --local path vendor/bundle
#RUN bundle config --local without development:test:assets

EXPOSE $TMG_APP_PORT
CMD rm -f tmp/pids/server.pid \
  && bundle exec rails db:migrate \
  && bundle exec rails s -b 0.0.0.0 -p $TMG_APP_PORT
