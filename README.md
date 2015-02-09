# Ruby Getting Started
A simply blog application that demonstrates the basics of Ruby on Rails. 

https://obscure-chamber-1903.herokuapp.com/

##Start-up

Run:

``` 
  $ rake db:migrate 
```

Start Redis:

```
  $ redis-server /usr/local/etc/redis.conf
```

Start Sidekiq:

```
  $ bundle exec sidekiq
```

Launch application:

```
  $ ../start-blog.sh 
```
