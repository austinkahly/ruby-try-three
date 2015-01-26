class UserMailer < ApplicationMailer
  default from: 'austin@wantable.com'

  def welcome_user(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to my awesome site!')
  end

  def comment_create(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email) do |format|
      format.html {render layout: 'comment_create'}
    end
  end
end
