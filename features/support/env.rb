require 'cucumber/rails'
require 'coveralls'
Coveralls.wear_merged!('rails')

ActionController::Base.allow_rescue = false

Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)
end

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Chromedriver.set_version '2.42'

chrome_options = %w[no-sandbox disable-popup-blocking disable-infobars]

chrome_options << 'headless'

Capybara.register_driver :selenium do |app|
	options = Selenium::WebDriver::Chrome::Options.new(
		args: chrome_options
)
Capybara::Selenium::Driver.new(
		app,
		browser: :chrome,
		options: options
)

end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)
FactoryBot::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end

Delayed::Worker.delay_jobs do | job |
  job.run_at && job.run_at > Time.now
end

Before '@stripe' do
  chrome_options << 'headless'
  StripeMock.start
end

After '@stripe' do
  StripeMock.stop
end

