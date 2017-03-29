# The Hitchhiker's Guide to Success (or Failure)

## Ruby version
We use `2.4.0`.
We try to stay on the latest stable or release candidate.
[rbenv](https://github.com/rbenv/rbenv) is pretty easy to set up but there's other equally good ruby version management
tools out there. Choose which one works for you.

* System dependencies


## Configuration

We use [Git](https://git-scm.com) and [GitHub](https://github.com) for version control and collaboration.
If you don't have a [GitHub](https://github.com) account already you can create one [here](https://github.com/join).
Follow instructions [here](https://git-scm.com/downloads) to install the latest version of Git for your system.


## Database creation

There's a [PostgreSQL](https://www.postgresql.org) for most operating systems. Follow the instructions
[here](https://www.postgresql.org/download/) to install it on your box.

PostgreSQL comes with an initializer script that hooks into start up. So the PostgreSQL server is always running in the
background. Otherwise you can start it with this command:

`$ sudo service postgresql start`

## Database initialization

The PostgreSQL server should be running. Otherwise start it with this command:

`$ sudo service postgresql start`

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions
