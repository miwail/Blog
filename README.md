# README

Pet-project to learn some devops tools.

#### TODO

- Make some basic web app ( some blog or etc) ;
- Deploy it in Docker;
- Setup own GitLab server;

- Setup Jenkins
    - Create pipeline to :
        - Build and deploy to prod env;
         - Autobuild on new commit on gitlab ( test branch) to test env;
    - Setup some artifact store service ?
    
- Deploy app in k8s;
- Setup monitoring systems:
    - Zabbix;
    - ELK stack + Grafana;
- Setup Patroni cluster;




  ##### Dockerfile
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
  
  ##### Docker-compose
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
      
      
      
   ##### Run:
   ```
     docker-compose run web rails new . --database=postgresql
   ```
  

