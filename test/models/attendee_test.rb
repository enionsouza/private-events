require 'rails_helper'

class AttendeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  user1_data = {username: 'fernado', email: 'fernando@example.com', password: 'Secret1', password_confirmation: 'Secret1'}
  user2_data = {username: 'anne_smith', email: 'anne_smith@example.com', password: 'Secret1', password_confirmation: 'Secret1'}
  event1_data = {title: 'Fernando\'s Awesome Party!', date: Time.now, location: 'Fernando\'s'}

  RSpec.describe Attendee do
    context 'checking for attendees creation' do
      it 'creates an attendee with for valid cases' do
        user1 = User.new(user1_data)
        user1.save
        user2 = User.new(user2_data)
        user2.save
        event = user1.create_event(event1_data)
        attendee1 = Attendee.new(user_id: user2.id, event_id: event.id)
        expect(attendee1.valid?).to eq(true)
      end
      it 'doesn\'t permit the creation of an attendee if it is the creator' do
        user1 = User.new(user1_data)
        user1.save
        event = user1.create_event(event1_data)
        attendee1 = Attendee.new(user_id: user1.id, event_id: event.id)
        expect(attendee1.valid?).to eq(false)
      end
      it 'presents the proper error message when the creator tries to become a guest' do
        user1 = User.new(user1_data)
        user1.save
        event = user1.create_event(event1_data)
        attendee1 = Attendee.new(user_id: user1.id, event_id: event.id)
        attendee1.valid?
        expect(attendee1.errors.full_messages).to eq(['User can\'t be the same as creator'])
      end
    end
  end
end
