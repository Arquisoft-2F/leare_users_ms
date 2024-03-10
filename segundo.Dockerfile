FROM ruby:3.2.3

RUN apt-get update -qq && apt-get install -y nodejs mariadb-client

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]