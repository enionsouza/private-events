class Event < ApplicationRecord
  belongs_to :creator
  has_many :attendees, dependent: :delete_all

  validates :title, presence: true, length: { in: 5..50 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :date, presence: true

  scope :past, -> { where('date < ?', Time.now).order(:date) }

  scope :upcoming, -> { where('date >= ?', Time.now).order(:date) }
end
