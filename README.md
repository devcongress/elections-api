# Elections Api

The Elections API project is a collection of endpoints to retrieve json-formatted elections-related data in Ghana since 1992.

This project is an initiative of [DevCongress](http://devcongress.org).

## What you need

* [Ruby](https://www.ruby-lang.org/en/): This project uses `Ruby v 2.4.0`, we try to stay on the latest stable or releast candidate version. We try to stay on the latest stable or release candidate. [rbenv](https://github.com/rbenv/rbenv) is pretty easy to set up but there's other equally good ruby version management tools out there. Choose which one works for you.

* [Bundler](https://rubygems.org/gems/bundler/versions/1.11.2): You can grab the latest version of the bundler by running `gem install bundler`. You will need this to grab all the dependencies of the application.

* [Postgres](https://www.postgresql.org): There's a [PostgreSQL](https://www.postgresql.org) for most operating systems. Follow the instructions [here](https://www.postgresql.org/download/) to install it on your box. PostgreSQL comes with an initializer script that hooks into start up. So the PostgreSQL server is always running in the background. Otherwise you can start it with this command: `$ sudo service postgresql start`

* [Git](https://git-scm.com): We use [Git](https://git-scm.com) and [GitHub](https://github.com) for version control and collaboration.
If you don't have a [GitHub](https://github.com) account already you can create one [here](https://github.com/join).
Follow instructions [here](https://git-scm.com/downloads) to install the latest version of Git for your system.

## Project Setup

1. Clone this repository on your computer with the following command: `https://github.com/devcongress/elections-api.git`

2. Run `bundle install` to grab all the dependencies of the project
3. Setup your environment variables using the intructions [here](http://railsapps.github.io/rails-environment-variables.html). Essentially you need to have variable values for `ELECTIONS_DB`, `ELECTIONS_DB_TEST`, `ELECTIONS_DB_USERNAME`, `ELECTIONS_DB_PASSWORD`
4. Run `rails db:create` to create your database
5. Run `rails db:migrate` to run all migrations
6. Run `rails server` to start your server 

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
