# Elections Api &middot; [![Build Status](https://travis-ci.org/devcongress/elections-api.svg?branch=master)](https://travis-ci.org/devcongress/elections-api) [![Test Coverage](https://codeclimate.com/github/devcongress/elections-api/badges/coverage.svg)](https://codeclimate.com/github/devcongress/elections-api/coverage) [![Code Quality](https://codeclimate.com/github/devcongress/elections-api/badges/gpa.svg)](https://codeclimate.com/github/devcongress/elections-api) [![Issues](https://codeclimate.com/github/devcongress/elections-api/badges/issue_count.svg)](https://codeclimate.com/github/devcongress/elections-api)


The Elections API project is a collection of endpoints to retrieve json-formatted elections-related data in Ghana since 1992.

This project is an initiative of [DevCongress](http://devcongress.org).

## What you need

* [Ruby](https://www.ruby-lang.org/en/): This project uses `Ruby v 2.4.1`, we try to stay on the latest stable or releast candidate version. We try to stay on the latest stable or release candidate. [rbenv](https://github.com/rbenv/rbenv) is pretty easy to set up but there's other equally good ruby version management tools out there. Choose which one works for you.

* [Bundler](https://rubygems.org/gems/bundler/versions/1.11.2): You can grab the latest version of the bundler by running `gem install bundler`. You will need this to grab all the dependencies of the application.

* [Postgres](https://www.postgresql.org): There's a [PostgreSQL](https://www.postgresql.org) for most operating systems. Follow the instructions [here](https://www.postgresql.org/download/) to install it on your box. PostgreSQL comes with an initializer script that hooks into start up. So the PostgreSQL server is always running in the background. Otherwise you can start it with this command: `$ sudo service postgresql start`

* [Git](https://git-scm.com): We use [Git](https://git-scm.com) and [GitHub](https://github.com) for version control and collaboration.
If you don't have a [GitHub](https://github.com) account already you can create one [here](https://github.com/join).
Follow instructions [here](https://git-scm.com/downloads) to install the latest version of Git for your system.

## Project Setup

1. Clone this repository on your computer with the following command: `git clone https://github.com/devcongress/elections-api.git`
2. Run `bundle install` to grab all the dependencies of the project
3. Create a copy of the `.env.example` file in the project root directory, rename it to `.env` and set the values for `ELECTIONS_DB`, `ELECTIONS_DB_TEST`, `ELECTIONS_DB_USERNAME`, `ELECTIONS_DB_PASSWORD` variables. All environment variables go into this file.
4. Run `rails db:create` to create your database
5. Run `rails db:structure:load` to load the db schema.
6. Run `rails server` to start your server

## How to run the test suite

To run the test suite, run `rails test`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## TODO
* Deployment Instructions
