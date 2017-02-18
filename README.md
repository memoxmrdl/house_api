# House - API

## Technical Specification
* Rails 5.0.1
* Ruby 2.4.0

## Getting started

Checkout the project
```
$ git clone git@github.com:memoxmrdl/house_api.git
$ cd house_api
```

## Create database
```
$ cp config/database.yml.example config/database.yml
$ rake db:create db:migrate db:seed
```

## Run project
```
$ rails server
```

## Run tests
```
$ rspec .
```
