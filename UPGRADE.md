How to upgrade Rails 4 into Rails 6? Step by Step

- It's recommended to set ruby into e.g v2.6.5 by creating `.ruby_version` (if your are using rbenv) and add `ruby '2.6.5'` in Gemfile

  ```ruby
  # Gemfile
  source 'https://rubygems.org'

  ruby '2.6.5'
  ```

- Change Rails version

  ```ruby
  # Gemfile
  - gem 'rails', '4.1.5'
  + gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
  ```
- Upgrade Saas Rails

  ```ruby
  # Gemfile
  - gem 'sass-rails', '~> 4.0.3'
  + gem 'sass-rails', '>= 6'
  ```

- Remove `rubyracer` if any, not needed
- Remove `cofee-rails` if any, or remove version tag

  ```ruby
  # Gemfile
  - gem 'coffee-rails', '~> 4.0.0'
  + gem 'coffee-rails' # let bundler choose version for now
  - gem 'therubyracer',  platforms: :ruby
  ```

- Ruby `bundle update` and fix dependencies until running `bundle` without errors
- Run console `rails c` to check,

- If you get errors : Expected to find a manifest file in `app/assets/config/manifest.js` fix it by create those file

  ```ruby
  # app/assets/config/manifest.js
  //= link_tree ../images
  //= link_directory ../javascripts .js
  //= link_directory ../stylesheets .css
  ```
- If you get error when migrate db `rails db:migrate`

  ```bash
  rails aborted!
  StandardError: An error has occurred, this and all later migrations canceled:

  Directly inheriting from ActiveRecord::Migration is not supported. Please specify the Rails release the migration was written for:

    class DeviseCreateUsers < ActiveRecord::Migration[4.1]
  /Users/gizipp/Code/pms/db/migrate/20140911020345_devise_create_users.rb:1:in <top (required)>
  ```

  simply change all migrations from `ActiveRecord::Migration` into with specified version e.g `ActiveRecord::Migration[6.0][6.1]` and try migrate again

- Add `gem 'webpacker'` in Gemfile
- Try run `rails s`, errors happen

  ```bash
  Webpacker configuration file not found /Users/gizipp/Code/pms/config/webpacker.yml. Please run rails webpacker:install Error: No such file or directory @ rb_sysopen - /Users/gizipp/Code/pms/config/webpacker.yml (RuntimeError)
```

then run `rails webpacker:install`

then change css js tag on `application.html.erb`

  ```ruby
  <%= stylesheet_pack_tag    'application' %>
  <%= javascript_pack_tag    'application' %>
  ```

### MISC errors
- If error `This Gemfile requires a different version of Bundler.` try run `gem install bundler`
- If you using `simple_form` and got errors Use `rails generate simple_form:install` to generate the Simple Form configuration.
