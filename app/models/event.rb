class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendees


  scope :past, -> { where('date < ?',Time.now ).order(:date)}

   scope :upcoming, -> {where('date >= ?',Time.now ).order(:date)} 

end
