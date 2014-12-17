source "https://yoomee:wLjuGMTu30AvxVyIrq3datc73LVUkvo@gems.yoomee.com"
source 'https://rubygems.org'
ruby '2.1.1'

gem 'rails', '4.1.1'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

# Yoomee gems
gem 'ym_core', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_core.git", :branch => 'rails-4', :ref => '1aea727c77e15596b7bdace83c1a665f18875f17'
# gem 'ym_core', :path => '~/Rails/Gems/ym_core'
gem 'ym_users', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_users.git", :branch => 'rails-4'
# gem 'ym_users', :path => '~/Rails/Gems/ym_users'
gem 'ym_notifications', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_notifications.git", :branch => 'rails-4'
# gem 'ym_notifications', :path => '~/Rails/Gems/ym_notifications'
gem 'ym_videos', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_videos.git", :branch => 'rails-4'
# gem 'ym_videos', :path => '~/Rails/Gems/ym_videos'
gem 'ym_tags', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_tags.git", :branch => 'rails-4'
# gem 'ym_tags', :path => '~/Rails/Gems/ym_tags'
gem 'ym_posts', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_posts.git", :branch => 'rails-4'
# gem 'ym_posts', :path => '~/Rails/Gems/ym_posts'
# gem 'ym_likes', :git => "https://deploy:#{ENV['GITLAB_AUTH_TOKEN']}@gitlab.yoomee.com/yoomee/ym_likes.git", :branch => 'rails-4'
gem 'ym_likes', :path => '~/Rails/Gems/ym_likes'

# Extra gems
gem 'friendly_id', '~> 5.0.0'
gem 'geocoder', '~> 1.2.1'
gem 'will_paginate'
gem 'select2-rails', '~> 3.5.7'
gem 'parsley-rails', '~> 2.0.0'
gem 'stamp'
gem 'pg_search'
gem 'nokogiri', '~> 1.5.0'
gem 'fog', '~> 1.9.0'
gem 'unicorn'
gem 'newrelic_rpm'

# specify versions of gems from ym_core
gem 'cancancan', '~> 1.8.0'
gem 'jquery-ui-rails', '~> 4.2.1'

# development and test gems
group :development do
  gem 'letter_opener'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
end

group :development, :test do
  gem 'debugger'
end

group :test do
  gem 'ym_test', :git => 'git@gitlab.yoomee.com:yoomee/ym_test.git'
end

# heroku gem
gem 'rails_12factor', group: :production
