class Remainder < ApplicationRecord

  belongs_to :user
  enum remainder_type: [:days, :minutes]

  after_create do
    if self.number.present? && self.remainder_type.present?
      if self.remainder_type.eql?('minutes')
        RemainderJob.set(wait: self.number.minutes).perform_later(self.user_id)
      else
        RemainderJob.set(wait: self.number.days).perform_later(self.user_id)
      end
    end
  end
end
