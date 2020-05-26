class UserMailer < ApplicationMailer

  def account_activation(user)
    @greeting = "こんにちは"
    @user = user
    mail to: user.email, subject: "Sample Appのアカウント認証"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
