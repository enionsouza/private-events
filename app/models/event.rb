class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendees
end
