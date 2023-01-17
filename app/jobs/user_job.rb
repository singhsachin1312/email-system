class UserJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.verify_email(user).deliver_now
  end
end
