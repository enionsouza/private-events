class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :assistance

  def assistance
    unless Attendee.where(user_id: user_id, event_id: event_id).empty?
      errors.add(:user_id, "is already attending this event")
    end
  end
end
