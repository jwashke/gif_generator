# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'

# Add additional requires below this line. Rails is not loaded until this point!
require 'rspec/rails'
require 'capybara'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)
# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")


  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  RSpec.configure do |config|
    config.mock_with :mocha

    config.before(:each) do
      stub_request(:get, "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=rabbit").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => "{\"data\":{\"type\":\"gif\",\"id\":\"Feu1dGsQ7q4wg\",\"url\":\"http:\\/\\/giphy.com\\/gifs\\/rabbit-bunny-super-sentai-Feu1dGsQ7q4wg\",\"image_original_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/giphy.gif\",\"image_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/giphy.gif\",\"image_mp4_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/giphy.mp4\",\"image_frames\":\"57\",\"image_width\":\"320\",\"image_height\":\"240\",\"fixed_height_downsampled_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/200_d.gif\",\"fixed_height_downsampled_width\":\"267\",\"fixed_height_downsampled_height\":\"200\",\"fixed_width_downsampled_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/200w_d.gif\",\"fixed_width_downsampled_width\":\"200\",\"fixed_width_downsampled_height\":\"150\",\"fixed_height_small_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/100.gif\",\"fixed_height_small_still_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/100_s.gif\",\"fixed_height_small_width\":\"133\",\"fixed_height_small_height\":\"100\",\"fixed_width_small_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/100w.gif\",\"fixed_width_small_still_url\":\"http:\\/\\/media3.giphy.com\\/media\\/Feu1dGsQ7q4wg\\/100w_s.gif\",\"fixed_width_small_width\":\"100\",\"fixed_width_small_height\":\"75\",\"username\":\"\",\"caption\":\"\"},\"meta\":{\"status\":200,\"msg\":\"OK\"}}", :headers => {})
    end
  end
end
