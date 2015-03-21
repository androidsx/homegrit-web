HomeGrit web
================

Receive in-home therapy from the best clinical psychologists of your community at your convenience.

[ ![Codeship Status for androidsx/homegrit-web](https://codeship.com/projects/c8b830c0-b13c-0132-21e3-7a1c9d708e01/status?branch=master)](https://codeship.com/projects/69782)



3rd party services in use
-------------------------

- Stripe: androidsx@androidsx.com
- Segment.io: androidsx@androidsx.com
- Heroku
     - [Dev machine](https://homegrit-web-development.herokuapp.com/)

Workspace  requirements
-----------------------

This application requires:

- Ruby 2.2.0
- Rails 4.2.0
- Postgres 9.x

Most likely, it will be something like:

1. Install `brew`
2. Install RVM: `curl -L https://get.rvm.io | bash -s stable`
3. Install Ruby 2.2 (using RVM): `rvm install 2.2.0`
4. Install Rails 4.2: `gem install rails -v 4.2.0 --no-ri --no-rdoc`
5. Install bundler: `gem install bundler`
6. Install [Postgress](http://postgresapp.com/). (Careful: not through homebrew)
7. Configure your classpath for Postgress. Add something like this to your `.bashrc`: `export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"`. Otherwise, Postgress commands like `createuser` won't be found

Here's a very useful guide to start your setup from scratch: [Install Rails](http://installrails.com/) or [Installing Rails](http://railsapps.github.io/installing-rails.html).

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
We use heroku, so use [this guide](https://devcenter.heroku.com/articles/getting-started-with-rails4) to setup your account.

Add the heroku remote `heroku git:remote -a homegrit-web-development` to be able to push to our `production` today. Then, `git push heroku master` will do the rest.

Open the logs with `heroku logs` (or with papertrail `heroku addons:open papertrail`).

In the near future, we should setup a `staging` machine using [this guide](https://devcenter.heroku.com/articles/multiple-environments), and be able to promote.

### Deployment in a new machine ###

1. Add this config vars:

```
heroku config:add \
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

2. `git push heroku master`
3. `heroku run rake db:migrate db:seed`
4. [Scale properly](https://devcenter.heroku.com/articles/getting-started-with-rails4#visit-your-application)

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
