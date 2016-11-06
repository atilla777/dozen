class UserMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    @token = user.single_access_token
    mail(to: user.email, subject: 'confirm registration')
  end
end
