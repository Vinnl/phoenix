# Phoenix

![Heroku](https://heroku-badge.herokuapp.com/?app=edit-tosdr-org)

Phoenix is a web app to submit points to the Terms of Service; Didn't Read project. The template used is located [here](https://github.com/lewagon/rails-templates)

## Development

The app was developped with Ruby on Rails 5.1.4 and Ruby 2.3.5. The database uses PostgreSQL. You must have those if you want to run the app.

Please refer to the CONTRIBUTING.md guide for more information. If anything is missing, please let us know.

## Database

All the details on the database schema can be found on the [wiki](https://github.com/tosdr/phoenix/wiki/database).

## Export

Careful! The postgres database dumps produced during this process contain user accounts that should
be kept secret. Never commit a database dump to git, or share it with someone who does not also have
access to our Heroku account!

```sh
# make sure you have phoenix checked out next to tosdr-build in a folder:
git clone https://github.com/tosdr/phoenix
git clone https://github.com/tosdr/tosdr-build
cd phoenix
export DATE=`date "+%Y%m%d%H%M%S"`
heroku pg:backups:capture --app edit-tosdr-org
heroku pg:backups:download --app edit-tosdr-org
mv latest.dump $DATE.dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d phoenix_development $DATE.dump
rails db:migrate
rails runner db/export_points_to_old_db.rb
rails runner db/export_services_to_old_db.rb
# topics and cases export not implemented yet

# go look at the export results:
cd ../tosdr-build

# notice some json formatting differences which will be undone again by grunt later:
git diff

# then build tosdr-build as usual, see https://github.com/tosdr/tosdr-build#build:
npm install
./node_modules/.bin/grunt
```

## API

All the details on the API can be found on the [wiki](https://github.com/tosdr/phoenix/wiki/api)

## Core developpers 
* [Chris](https://github.com/piks3l/) - push rights on master and access to production
* [Madeline](https://github.com/madoleary) - push rights on master
* [Michiel](https://github.com/michielbdejong) - push rights on master and access to production

### Hosting
* https://phoenix.tosdr.org (deprecated) - Chris' Heroku
* https://edit.tosdr.org (production) - Michiel's Heroku (Chris has access too)


## License

AGPL-3.0+ (GNU Affero General Public License, version 3 or later)

