# Preview all emails at http://localhost:3000/rails/mailers/reset
class ResetPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reset/password_reset
  def password_reset
    Reset.password_reset
  end

end
