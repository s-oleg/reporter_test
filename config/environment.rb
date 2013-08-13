# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Reporter::Application.initialize!

Dir[Rails.root + 'lib/custom_extensions/*.rb'].each {|file| require file }
