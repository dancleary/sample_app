# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SampleApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
	:user_name => 'Dan.Cleary',
	:password => 'Polkmnji7',
	:domain => 'https://gentle-hamlet-6736.herokuapp.com',
	:address => 'smtp.sendgrid.net',
	:port =>  587,
	:authentication => :plain,
	:enable_starttls_auto => true

}
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8