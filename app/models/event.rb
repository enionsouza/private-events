class Event < ApplicationRecord
  has_one :creator
  has_many :guests
end
