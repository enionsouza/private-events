class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creators, dependent: :delete_all
  has_many :attendees, dependent: :delete_all

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

  # typically, 'arg' is a hash like: {title: 'title', date: 'date', location: 'location'}
  def create_event(arg)
    creator = creators.build
    creator&.save
    event = creator.build_event(arg)
    event&.save
    event
  end

  def show_events
    creators.map(&:event).compact
  end

  def show_invitations
    attendees.map(&:event).compact
  end
end
