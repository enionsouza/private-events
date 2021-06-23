class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creators
  has_many :attendees

  # typically, 'arg' is a hash like: {title: 'title', date: 'date', location: 'location'}
  def create_event(arg)
    creator = creators.build
    creator&.save
    event = creator.build_event(arg)
    event&.save
  end

  def show_events
    events = creators.map(&:event)
    events.compact
  end
end

