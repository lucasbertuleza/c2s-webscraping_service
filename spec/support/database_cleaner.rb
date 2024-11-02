# @see https://github.com/DatabaseCleaner/database_cleaner
require "database_cleaner/active_record" unless defined?(DatabaseCleaner)

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
