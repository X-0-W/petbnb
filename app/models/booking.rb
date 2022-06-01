class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :start_date, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    errors.add(:end_date, "can't be in the past") unless end_date > start_date
  end
end
