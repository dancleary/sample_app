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
	def activity(followers)
    mail( :to => followers, :subject => '#{user} has created a post.')
  end
  def message(user, recipient)
    mail( :to => recipient, :subject => 'Message from #{user}.')
  end
end