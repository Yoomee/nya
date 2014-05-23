# README

This is a Rails 4/Ruby 2 application for the NYA

## Wireframes

Wireframes are available at: http://nya-prototype.herokuapp.com/

## Dev environment (Mac OSX Mavericks)

Download and install postgres.app from http://postgresapp.com/

We are using Postgres 9.3.4

Add the /bin directory that ships with Postgres.app to your PATH
(preferably in .profile, .bashrc, .zshrc, or the like to make sure this gets set for every Terminal session):

```
PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
```

Then run from your projects directory:

```
git clone git@gitlab.yoomee.com:nya/nya_rails4.git
cd nya_rails4/
bundle
rake db:setup
```

## Tests

Run cucumber tests with spring using:

```
./bin/cucumber
```

If the project requires a restart do:

```
./bin/spring stop
```

## Deployment

TODO
