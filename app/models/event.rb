class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendees

  def self.past
    where('date < ?',Time.now ).order(:date)
  end
  def self.upcoming
    where('date >= ?',Time.now ).order(:date)
  end
end
