# Load the rails application
require File.expand_path('../application', __FILE__)

#google credentials
GOOGLE_KEY = ENV["GOOGLE_KEY"]
GOOGLE_SECRET = ENV["GOOGLE_SECRET"]
GOOGLE_SIMPLE_API_KEY = ENV["GOOGLE_SIMPLE_API_KEY"]
SESSION_SECRET = ENV["SESSION_SECRET"]

# Initialize the rails application
IpcamForGlass::Application.initialize!
