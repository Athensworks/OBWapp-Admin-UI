# OBWapp-Admin-UI
ActiveAdmin-based web interface for administering the Ohio Brew Week backend


## Required Setup

Need to set some environment variables:

* `ADMIN_USERNAME=` (required)
* `ADMIN_PASSWORD=` (required)

You can so by setting them in your start command (i.e. `ADMIN_USERNAME=beer ADMIN_PASSWORD=hops bin/rails c`) or if you're using `foreman` in your `.env` file

### Database setup

`bin/rake db:create db:schema:load # we have tons of non-migration based changes, so just use schema load to get started`
