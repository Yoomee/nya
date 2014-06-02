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

Tests using selenium require a driver. We use firefox which is available to download
from http://www.mozilla.org/

Run cucumber tests with spring using:

```
./bin/cucumber
```

If the project requires a restart do:

```
./bin/spring stop
```

## Stage

The staging site is hosted on heroku under the developer@yoomee.com account.

**To set up your dev environment to deploy to stage:**

```
heroku git:remote -a nya-stage
```

Login when prompted.

**Deploying to stage from master branch**

If you don't have it, you will need to install the heroku toolbelt - https://toolbelt.heroku.com/

Checkout the heroku branch
```
git checkout heroku
```

Merge your changes from master
```
git merge master
```

Bundle again, commit and push
```
bundle
git add .
git commit -m 'Bundled'
git push origin heroku
```

Deploy to heroku
```
git push heroku heroku:master
```

If there are any migrations
```
heroku run rake db:migrate
```

Don't forget to change back to your master branch!
```
git checkout master
```


***Dev notes***
To package the default gems, the bundler version needs to be at least 1.6.2. If not -
```
gem update bundler
```
To stop the bundle being packaged into /vendor/cache once the yoomee gems are available on gems.yoomee.com
```
rm -rf .bundle
rm -rf vendor/cache
bundle
```
