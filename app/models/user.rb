class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator_id, dependent: :delete_all
  has_many :attendances, dependent: :delete_all
  has_many :attended_events, through: :attendances, source: :event

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

  # typically, 'arg' is a hash like: {title: 'title', date: 'date', location: 'location'}
  # def create_event(arg)
  #   creator = creators.build
  #   creator&.save
  #   creator.build_event(arg)
  # end

  # def show_events
  #   creators.map(&:event).compact
  # end

  # def show_invitations
  #   attendees.map(&:event).compact
  # end
end
