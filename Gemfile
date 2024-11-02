source "https://rubygems.org"

ruby "3.2.6"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.5"

# Use mysql as the database for Active Record
gem "mysql2"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem "rack-cors"

gem "hutch"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri windows]
  # https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails"
  # https://github.com/pry/pry-rails
  gem "pry-rails"
  # https://github.com/rspec/rspec-rails
  gem "rspec-rails"
  # https://rubocop.org/
  gem "rubocop", require: false
  # https://github.com/rubocop/rubocop-factory_bot
  gem "rubocop-factory_bot", require: false
  # https://github.com/rubocop/rubocop-performance/
  gem "rubocop-performance", require: false
  # https://docs.rubocop.org/rubocop-rails/
  gem "rubocop-rails", "~> 2.23.1", require: false
  # https://github.com/rubocop/rubocop-rspec
  gem "rubocop-rspec", require: false
  # https://github.com/rubocop/rubocop-rspec_rails
  gem "rubocop-rspec_rails", require: false
  # https://github.com/standardrb/standard
  gem "standard", require: false
  # https://github.com/standardrb/standard-rails
  gem "standard-rails", require: false
end

group :development do
  # https://github.com/flyerhzm/bullet
  gem "bullet"
  # https://github.com/castwide/solargraph
  gem "solargraph", require: false
  # https://github.com/iftheshoefritz/solargraph-rails/
  gem "solargraph-rails", require: false

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # https://github.com/presidentbeef/brakeman
  gem "brakeman", require: false
  # https://github.com/DatabaseCleaner/database_cleaner
  gem "database_cleaner-active_record"
  # https://github.com/flyerhzm/rails_best_practices
  gem "rails_best_practices", require: false
  # https://github.com/troessner/reek
  gem "reek", require: false
  # https://matchers.shoulda.io/docs
  gem "shoulda-matchers"
  # https://github.com/simplecov-ruby/simplecov
  gem "simplecov", require: false
end
