class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creators
  has_many :guests 

  def create_event(title, date, location)
    creator= self.creators.build()
    creator.save
    event = creator.build_event({title: title, date: date, location: location})
    event.save unless event.nil?
  end
  def show_events
    self.creators.select{|creator| creator.event unless creator.event.nil?}
  end
end

