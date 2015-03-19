Rails Stripe Coupons
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Receive in-home therapy from the best clinical psychologists of your community at your convenience/

Initial requirements
-------------

This application requires:

- Ruby 2.2.0
- Rails 4.2.0
- Postgres 9.x

Learn more how to install it [here](http://installrails.com/) or [Installing Rails](http://railsapps.github.io/installing-rails.html). But do NOT install Postgres via homebrew.

Most likely it will end up being these commands:
1. Install brew
2. `curl -L https://get.rvm.io | bash -s stable`
3. `rvm install 2.2.0`
4. Install [postgress](http://postgresapp.com/)
5. `gem install bundler`
6. `gem install rails -v 4.2.0 --no-ri --no-rdoc`


3rd party services
-------------

- Stripe: androidsx@androidsx.com
- Segment.io: androidsx@androidsx.com

Setup
-------------

1. `./script/bootstrap`

Run
-------------

1. `rails s`
2. Open `http://localhost:3000`


Deployment
------------
The app is deployed to heroku, so `git push heroku master` will do. Add any config variable with `heroku config:add MAILCHIMP_API_KEY='a6v34ggf23c123098765fcc6c996c540-us2' MAILCHIMP_LIST_ID='4x8bfgb034'

Open the logs with `heroku addons:open papertrail`


Recreate the test DB
---------------

1. Kill the server and any open consoles
2. `rake db:reset`
3. `rake db:create db:migrate db:seed`

Modify the DB schema (aka add a migration rule)
-------------------------

1. `rails g migration AddProjectAndOrganizationToPointTransactions`
2. `rake db:migrate`
3. Optionally: `rake db:rollback` and `rake db:migrate` again, just to make sure rollbacks work
4. `rake db:reset`


Run the specs (tests)
-------------

All of them: `rake`


Run the Rails console on Live
----------------

`heroku run bundle exec rails c`


Other
-----

- Forked from [RailsApps](https://github.com/RailsApps/rails-stripe-coupons)
