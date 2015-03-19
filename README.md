Rails Stripe Coupons
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Receive in-home therapy from the best clinical psychologists of your community at your convenience.

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
2. Have a look at `config/secrets.yml` for admin user/passwords.

Run
-------------

1. `rails s`
2. Open `http://localhost:3000`


Deployment
------------
We use heroku, so use (this guide)[https://devcenter.heroku.com/articles/getting-started-with-rails4] to setup your account.

Add the heroku remote `heroku git:remote -a homegrit-web-development` to the machine of development. Then, `git push heroku master` will do the rest.

Open the logs with `heroku logs` (or with papertrail `heroku addons:open papertrail`)

### Deployment in a new machine ###

Needed config vars in heroku that need to be done for every new machine:

```heroku config:add \
    MAILCHIMP_API_KEY="" \
    MAILCHIMP_LIST_ID="" \
    ADMIN_NAME="" \
    ADMIN_EMAIL="" \
    ADMIN_PASSWORD="" \
    GMAIL_USERNAME="" \
    GMAIL_PASSWORD="" \
    DOMAIN_NAME="" \
    STRIPE_API_KEY="" \
    STRIPE_PUBLISHABLE_KEY="" \
    SECRET_KEY_BASE=""
```

1. `git push heroku master`
2. `heroku run rake db:migrate db:seed`
3. [Scale properly](https://devcenter.heroku.com/articles/getting-started-with-rails4#visit-your-application)

If the dynos crashed for whatever reason, you can force restart them manually: `heroku ps:restart`.


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
