class UserMailer < ApplicationMailer

  def account_activation(user)
    @greeting = "こんにちは"
    @user = user
    mail to: user.email, subject: "Sample Appのアカウント認証"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワード再設定用URLの送付"
  end
end
