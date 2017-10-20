source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.6'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'
# Make rails console db queries to show as tables
gem 'hirb'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 0.21.0'
# Use Puma as the app server
gem 'puma', '~> 3.10.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # A testing framework for Rails
  gem 'rspec-rails', '~> 3.7.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Strategies for cleaning databases. Can be used to ensure a clean state for testing.
  gem 'database_cleaner', '~> 1.6.1'
  # A framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.
  gem 'factory_girl_rails', '~> 4.8.0'
  # Used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker', '~> 1.8.4'
  # Ruby JSON Schema Validator
  gem 'json-schema', '~> 2.8.0'
  # Making tests easy on the fingers and eyes
  gem 'shoulda-matchers', '~> 3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'