class Reset < ApplicationMailer

  def password_reset(user)
    @user = user
    mail(to: "<#{user.email}>", subject: "Password Reset Information for Twixt")
  end

end
