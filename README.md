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

Tests using poltergeist require phantomjs.

Install with: ```brew install phantomjs```

Run cucumber tests with spring using:

```
./bin/cucumber
```

If the project requires a restart do:

```
./bin/spring stop
```

## Production

The production site is hosted on heroku under the developer@yoomee.com account. The url is http://www.mybigidea.org.uk

### Git remotes for heroku
When you are first getting set up to develop or deploy this app, you will need to add git remotes for heroku. Deploying instrutions in this readme assume that they are set up as follows
```
git remote add heroku git@heroku.com:nya-stage.git
```

###Deploying to heroku

```
git push heroku master
```

If there are any migrations
```
heroku run rake db:migrate
```
