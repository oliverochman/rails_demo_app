require 'coveralls'
Coveralls.wear_merged!('rails')
require 'cucumber/rails'
require 'webmock/cucumber'
ActionController::Base.allow_rescue = false
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

WebMock.allow_net_connect!

Chromedriver.set_version '2.33'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: %w( headless disable-popup-blocking disable-infobars)
  )

  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
  )
end
Capybara.javascript_driver = :selenium
Cucumber::Rails::Database.javascript_strategy = :truncation

Before '@get_cheese' do

  # to get the reponse from the api to ur fixture file run:
  # curl "https://api.spoonacular.com/recipes/search?apiKey=your-api-key&number=5&query=cheese" -o features/support/fixtures/api_response_food_get_cheese.txt

  stub_request(:get, "https://api.spoonacular.com/recipes/search").
  with(
    query: {
      number: 5,
      query: "cheese",
      apiKey: "your-api-key"
    }).
  to_return(status: 200, body: Rails.root.join('features', 'support', 'fixtures', 'api_response_food_get_cheese.json').read, headers: {})
end