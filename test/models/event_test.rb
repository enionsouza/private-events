require 'rails_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  user1_data = { username: 'fernado', email: 'fernando@example.com', password: 'Secret1',
                 password_confirmation: 'Secret1' }
  event1_data = { title: 'Fernando\'s Awesome Party!', date: Time.now, location: 'Fernando\'s' }

  RSpec.describe Event do
    context 'checking validations for creating events' do
      it 'creates an event from an existing user' do
        user1 = User.new(user1_data)
        user1.save
        user1.create_event(event1_data).save
        expect(Event.first.id).to eq(1)
      end
      it 'rejects an invalid event creation with a creator' do
        user1 = User.new(user1_data)
        user1.save
        creator1 = Creator.new(user_id: user1.id)
        invalid_event = Event.new(title: 'Come', date: Time.now, location: 'Anne\'s Place', creator_id: creator1.id)
        expect(invalid_event.valid?).to eq(false)
      end
      it 'rejects an event creation with no creator' do
        invalid_event = Event.new(event1_data)
        expect(invalid_event.valid?).to eq(false)
      end
      it 'presents the errors when trying to create an event without a creator' do
        invalid_event = Event.new(event1_data)
        invalid_event.invalid?
        expect(invalid_event.errors.full_messages).to eq(['Creator must exist'])
      end
    end
  end
end
