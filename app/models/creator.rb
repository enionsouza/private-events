class Creator < ApplicationRecord
  has_one :event, dependent: :destroy
  belongs_to :user
end
