FROM ruby:3.2.3

RUN apt-get update -qq && apt-get install -y nodejs mariadb-client

WORKDIR /app

RUN gem install rails

RUN rails new . --force --database=mysql

RUN bundle install

COPY Gemfile* ./

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]