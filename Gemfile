# encoding : utf-8
#source 'https://rubygems.org'
source 'http://ruby.taobao.org'

gem 'rails', '3.2.12'
gem 'bootstrap-sass'
gem 'jquery-rails'

gem 'bcrypt-ruby'

gem 'will_paginate'              #
gem 'bootstrap-will_paginate'    #作用是设置 willpaginate 使用 Bootstrap 中的分页样式

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'thin'
  gem 'rspec-rails'

  gem 'guard-rspec'
  gem 'spork'
  gem 'guard-spork'

  gem 'simplecov'

  gem 'faker'   #使用这个 gem，我们可以使用半真实的名字和 Email 地址创建示例用户
end

group :development do
  gem 'annotate'
end

group :test do
  gem 'capybara'

  gem "rb-fchange", "~> 0.0.6"
  gem 'rb-notifu', '~>0.0.4'
  gem "wdm", "~> 0.1.0"
  gem "win32console", "~> 1.3.2"

  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
