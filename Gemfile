source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'httparty'
gem 'mirror-api'
gem 'jquery-rails'
gem 'figaro'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'geocoder'

group :assets do
  gem 'less-rails'
  gem 'therubyracer', :platform=>:ruby
  gem 'twitter-bootstrap-rails'
end
group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :rbx]
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
