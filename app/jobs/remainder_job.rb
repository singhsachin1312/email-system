class RemainderJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    @user = User.find_by_id(user_id)
    UserMailer.remainder_email_to_verify(@user).deliver_now
  end
end
