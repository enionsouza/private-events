require 'rails_helper'

RSpec.describe 'Edit an existing Event', type: :system do
  before(:each) do
    user1 = User.new({ username: 'user001', email: 'user001@example.com', password: 'Secret1',
                       password_confirmation: 'Secret1' })
    user1.save
    event1 = user1.events.build({ title: 'My Awesome Party', date: Time.now, location: 'At my club!' })
    event1.save
  end

  describe 'edit events page' do
    it 'permits editting if data is valid' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: 'My Super Awesome Party'
      fill_in 'Date:', with: '09092022'
      fill_in 'Where?:', with: 'Somewhere over the rainbow'
      click_button 'Update Event'
      expect(page).to have_content 'My Super Awesome Party'
    end

    it 'rejects request if title is too short' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: 'aa'
      fill_in 'Date:', with: '09092022'
      fill_in 'Where?:', with: 'Somewhere over the rainbow'
      click_button 'Update Event'
      expect(page).to have_content 'Title is too short (minimum is 5 characters)'
    end

    it 'rejects request if date is missing' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: 'My Super Awesome Party'
      fill_in 'Date:', with: ''
      fill_in 'Where?:', with: 'Somewhere over the rainbow'
      click_button 'Update Event'
      expect(page).to have_content 'Date can\'t be blank'
    end
    it 'rejects request if title is missing' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: ''
      fill_in 'Date:', with: '09092022'
      fill_in 'Where?:', with: 'Somewhere over the rainbow'
      click_button 'Update Event'
      expect(page).to have_content 'Title can\'t be blank'
    end
    it 'rejects request if location is missing' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: 'My Super Awesome Party'
      fill_in 'Date:', with: '09092022'
      fill_in 'Where?:', with: ''
      click_button 'Update Event'
      expect(page).to have_content 'Location can\'t be blank'
    end

    it 'Shows the event show page if passed' do
      visit root_path
      click_link 'See more'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Edit'
      fill_in 'Title:', with: 'My Super Awesome Party'
      fill_in 'Date:', with: '09092022'
      fill_in 'Where?:', with: 'Somewhere over the rainbow'
      click_button 'Update Event'
      expect(page).to have_css('h1', text: 'My Super Awesome Party')
    end
  end
end
