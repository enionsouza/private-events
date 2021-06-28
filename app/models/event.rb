class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, dependent: :delete_all
  has_many :attendees, through: :attendances, source: :user

  validates :title, presence: true, length: { in: 5..50 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :date, presence: true

  scope :past, -> { where('date < ?', Time.now).order(date: :desc) }

  scope :upcoming, -> { where('date >= ?', Time.now).order(:date) }
end
