class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendees, dependent: :delete_all


  scope :past, -> { where('date < ?',Time.now ).order(:date)}

   scope :upcoming, -> {where('date >= ?',Time.now ).order(:date)} 

end
