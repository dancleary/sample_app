class Notifier < ActionMailer::Base
	default :from => 'LunchSelector@gentle-hamlet-6736.herokuapp.com'
	def welcome_email(user)
		@user = user
		@url = 'https://gentle-hamlet-6736.herokuapp.com/signin'
		mail( :to  => user.email, :subject => 'Thanks for signing up' )
		
	end
	def invitation(user, place)
		@loc = place

		
		mail( :to => user, :subject => 'Lunch Invite')
	end
end