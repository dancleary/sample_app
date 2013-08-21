# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SampleApp::Application.initialize!

#ActionMailer::Base.stmp_settings = {
#	:user_name => 'dan.cleary@sendgrid.com',
#	:password => 'Polkmnji7',
#	:domain => '#',
#	:address => 'smtp.sendgrid.net'
#	:port =>  587,
#	:authentication => :plain
#	:enable_starttls_auto => true
#}