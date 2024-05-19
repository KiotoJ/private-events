FROM ruby:3.3.0-alpine
RUN apk update && apk add build-base postgresql-dev git tzdata imagemagick nodejs yarn
WORKDIR /app
COPY Gemfile* .
RUN gem install bundler:2.4.22
COPY . /app
RUN bundle install