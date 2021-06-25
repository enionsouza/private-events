class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :assistance, :prevent_creator_as_attendee

  def assistance
    return if Attendee.where(user_id: user_id, event_id: event_id).empty?

    errors.add(:user_id, 'is already attending this event')
  end

  def prevent_creator_as_attendee
    if Event.find(event_id).creator.user_id == user_id
      errors.add(:user_id, 'can\'t be the same as creator')
    end
  end
end
