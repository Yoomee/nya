source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Yoomee gems
gem 'ym_core', :git => 'git@gitlab.yoomee.com:yoomee/ym_core.git', :branch => 'rails-4'
# gem 'ym_core', :path => '~/Rails/Gems/ym_core'
gem 'ym_users', :git => 'git@gitlab.yoomee.com:yoomee/ym_users.git', :branch => 'rails-4'
# gem 'ym_users', :path => '~/Rails/Gems/ym_users'
gem 'ym_notifications', :git => 'git@gitlab.yoomee.com:yoomee/ym_notifications.git', :branch => 'rails-4'
# gem 'ym_notifications', :path => '~/Rails/Gems/ym_notifications'
gem 'ym_videos', :git => 'git@gitlab.yoomee.com:yoomee/ym_videos.git', :branch => 'rails-4'
# gem 'ym_videos', :path => '~/Rails/Gems/ym_videos'
gem 'ym_tags', :git => 'git@gitlab.yoomee.com:yoomee/ym_tags.git', :branch => 'rails-4'
# gem 'ym_tags', :path => '~/Rails/Gems/ym_tags'
gem 'ym_posts', :git => 'git@gitlab.yoomee.com:yoomee/ym_posts.git', :branch => 'rails-4'
# gem 'ym_posts', :path => '~/Rails/Gems/ym_posts'

# Extra gems
gem 'geocoder'

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

