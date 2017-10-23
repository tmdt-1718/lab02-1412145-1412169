class UserMailer < ApplicationMailer

	def notification(user_id,current_account)
    @user = Account.find_by(id: user_id)
    @sender = current_account
    mail(to: @user.username, subject: 'NOTIFICATION EMAIL FROM H20')
  end
end
