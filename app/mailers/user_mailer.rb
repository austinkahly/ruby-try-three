class UserMailer < ApplicationMailer

  def welcome_email(user_id)
    @user = User.find(user_id)
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to my awesome site!') do |format|
      format.html {render layout: 'welcome_email'}
    end
  end

  def comment_create(user_id)
    @user = User.find(user_id)
    @url = 'http://example.com/login'
    mail(to: @user.email) do |format|
      format.html {render layout: 'comment_created'}
    end
  end
end
