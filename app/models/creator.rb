class Creator < ApplicationRecord
  has_one :event
  belongs_to :user
end
