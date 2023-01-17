class User < ApplicationRecord

  validates :first_name, :last_name, :email, presence: true
  has_many :remainders

  after_create do
    UserJob.perform_now(self)
  end

end
