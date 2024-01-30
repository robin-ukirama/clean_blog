source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.5'
gem 'image_processing',           '1.9.3'
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.9'
gem 'bcrypt',         '3.1.13'
gem 'faker',          '2.11.0'
gem 'will_paginate',           '3.3.0'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem 'puma'       
gem 'sass-rails' 
gem 'webpacker'  
gem 'turbolinks'
gem 'jbuilder' 
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console'        
  gem 'rack-mini-profiler' 
  gem 'listen'             
  gem 'spring'             
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'       
  gem 'webdrivers'               
  gem 'rails-controller-testing' 
  gem 'minitest'                 
  gem 'minitest-reporters'       
  gem 'guard'                    
  gem 'guard-minitest'    
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Uncomment the following line if you're running Rails
# on a native Windows system:
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
