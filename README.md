## Setup
1. Clone repo
2. Run `bundle install` to load dependencies
3. Run `rake db:setup`to load schema for app and queue
4. Run `rake db:seed` to add default categories and category groups
5. Run `rails s -b 0.0.0.0 -p 3000` to start web server
6. Run `bin/jobs start` so that jobs can run in the background

## TODO
1. Add paging support for upsert CC/Bank Accounts
2. For performance reasons, maybe I should've made UUID the primary key in order to easily make use of uspert_all
3. Implement error handling for API requests
4. Needs tests
