Rails Todo API
===============

> Rails Todo API based on [Scotch.io](https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one) tutorial

## Table of Contents
- [Rails Todo API](#rails-todo-api)
    - [Table of Contents](#table-of-contents)
    - [Tutorial Links](#tutorial-links)
    - [Getting started](#getting-started)
        - [System requirements](#system-requirements)
        - [Installation](#installation)
        - [Running tests](#running-tests)

## Tutorial Links

1. https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
1. https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-two
1. https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-three

## Getting started

### System requirements

- Ruby 2.4.0 +
- Rails 5.0.2
- PostgreSQL
- Unix like operating system (OS X, Ubuntu, Debian, etc.)
- Not yet tested on Windows

### Installation

1. Clone or download the repository
1. Install Ruby 2.4.0 via [rbenv](https://github.com/rbenv/rbenv#installation) or [rvm](https://github.com/rvm/rvm)
1. [Install Rails](https://github.com/rails/rails) *(if not already installed)*
1. Install PostgreSQL *(if not already installed)*. Here is a list of [installation options](https://www.postgresql.org/download/) based on your development machine's operating system. I am currently using [Postgresapp](https://postgresapp.com/) and have used [Homebrew](https://brew.sh/) (Not sure why, but I had issues restarting the service this time)
1. `cd` into project directory *(If not already there)*
1. `cp config/database.yml.example config/database.yml`
1. `cp config/secrets.yml.example config/secrets.yml`
1. `rake db:create:all db:setup`
1. `rails s`
1. View in browser at *http://localhost:3000*

### Running tests

```shell
# Rspec tests
bundle exec rspec

# Automated testing for Cucumber and Rspec
bundle exec guard
```