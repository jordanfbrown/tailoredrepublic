source 'https://rubygems.org'
gem 'rails', '3.2.9'

group  :test do
  gem 'sqlite3'
end

group :development, :production do
  gem 'pg'
end

group :production do
  gem 'thin'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'compass-rails', '>= 1.0.3', :group => :assets
gem 'zurb-foundation', '>= 3.2.0', :group => :assets
gem 'devise', '>= 2.1.2'
gem 'cancan', '>= 1.6.8'
gem 'rolify', '>= 3.2.0'
gem 'quiet_assets', '>= 1.0.1', :group => :development
gem 'enumerated_attribute', :git => 'git://github.com/jeffp/enumerated_attribute.git'
gem 'numbers_and_words'
gem 'stripe'