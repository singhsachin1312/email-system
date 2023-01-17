class UserMailer < ApplicationMailer

  def verify_email(user)
    @user = user
    @url  = ENV['HOST_URL'] + "/users/#{@user.id}/verify_email_address"
    mail(to: @user.email, subject: 'Verify Your Email')
  end

  def remainder_email_to_verify(user)
    @user = user
    unless @user.email_verified?
      @url  = ENV['HOST_URL'] + "/users/#{@user.id}/verify_email_address"
      mail(to: @user.email, subject: 'Remainder, Verify Your Email')
    end
  end
end
