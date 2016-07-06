class UserMailer < ApplicationMailer
  default from: 'davidkeith0519@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/mail'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
