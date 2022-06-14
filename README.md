# README

Test app in ROR



  ####Dockerfile
  ```
  from ruby:3.2-rc
  RUN apt update -qq && apt install -y nodejs postgresql-client && apt clean

  WORKDIR /myapp
  COPY Gemfile /myapp/Gemfile
  COPY Gemfile.lock /myapp/Gemfile.lock
  RUN bundle install
  EXPOSE 3000
  CMD ["rails", "server", "-b", "0.0.0.0"]
  ```
  
  ####Docker-compose
  ```
  version: "3.3"
services:
  db:
    image: postgres
    volumes:
      - ./tmp/db:/var/lib/postgresql/data
    environment:
      POSTGRES_PASSWORD: password
  web:
    build: .
    command: bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'"
    volumes:
      - .:/myapp
    ports:
      - "80:3000"
    depends_on:
      - db
      ```
      
      
      
   ####Run:
     docker-compose run web rails new . --database=postgresql
  
  

