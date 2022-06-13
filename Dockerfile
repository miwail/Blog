from ruby:3.2-rc
RUN apt update -qq && apt install -y nodejs postgresql-client && apt clean

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
