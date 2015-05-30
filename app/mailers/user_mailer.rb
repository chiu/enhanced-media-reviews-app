# class UserMailer < ApplicationMailer
#   default from: 'notifications@example.com'

#   def welcome_email(user)
#     @user = user
#     @url  = 'http://example.com/login'
#     mail(to: @user.email,
#          subject: 'Welcome to My Awesome Site') do |format|
#       format.html { render 'welcome_email' }
#       format.text { render text: 'welcome_email' }
#     end
#   end
# end

# class UserMailer < ApplicationMailer
#   default from: 'notifications@example.com'

#   def welcome_email(user)
#     @user = user
#     @url  = 'http://example.com/login'
#     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
#   end
# end



# class UserMailer < ApplicationMailer
class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
     subject: 'Welcome to My Awesome Site',
     template_path: 'user_mailer',
     template_name: 'welcome_email')

  end

  def goodbye_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email,
     subject: 'Welcome to My Awesome Site',
     template_path: 'user_mailer',
     template_name: 'goodbye_email')

  end




end