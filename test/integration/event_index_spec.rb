require 'rails_helper'

RSpec.describe 'Root page', type: :system do
  describe 'index page' do
    it 'shows the right title for this section' do
      visit root_path
      expect(page).to have_css('h1', text: 'All events')
    end
    it 'shows log in option on navbar when not logged in' do
      visit root_path
      expect(page).to have_css('a', text: 'Log in')
    end
    it 'shows sign up option on navbar when not logged in' do
      visit root_path
      expect(page).to have_css('a', text: 'Sign up')
    end
    it 'shows sign up option on navbar when not logged in' do
      visit root_path

      expect(page).to have_css('a', text: 'Sign up')
    end
  end
  describe 'Handling authentications and authorizations', type: :feature do
    it 'asks for login when leaving index if not logged in' do
      visit root_path
      click_link 'Create an event'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    it 'logs me in' do
      User.create({ username: 'user001', email: 'user001@example.com', password: 'Secret1',
                    password_confirmation: 'Secret1' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it 'logs me out' do
      User.create({ username: 'user001', email: 'user001@example.com', password: 'Secret1',
                    password_confirmation: 'Secret1' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end

    it 'rejects login if data is incorrect' do
      User.create({ username: 'user001', email: 'user001@example.com', password: 'Secret1',
                    password_confirmation: 'Secret1' })
      visit root_path
      click_link 'Log in'
      fill_in 'Email', with: 'user002@example.com'
      fill_in 'Password', with: 'invalid'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'allows me into events/new if logged in' do
      User.create({ username: 'user001', email: 'user001@example.com', password: 'Secret1',
                    password_confirmation: 'Secret1' })
      visit root_path
      click_link 'Create an event'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      click_button 'Log in'
      expect(page).to have_content 'New Event'
    end

    it 'signs me up' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'user001'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      fill_in 'Password confirmation', with: 'Secret1'
      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    it 'rejects invalid username for sign up' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'aa'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      fill_in 'Password confirmation', with: 'Secret1'
      click_button 'Sign up'
      expect(page).to have_content 'Username is too short (minimum is 3 characters)'
    end

    it 'rejects invalid email for sign up' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'user001'
      fill_in 'Email', with: '@example.com'
      fill_in 'Password', with: 'Secret1'
      fill_in 'Password confirmation', with: 'Secret1'
      click_button 'Sign up'
      expect(User.all.empty?).to eq(true)
    end

    it 'rejects wrong password confirmation for sign up' do
      visit root_path
      click_link 'Sign up'
      fill_in 'Username', with: 'user001'
      fill_in 'Email', with: 'user001@example.com'
      fill_in 'Password', with: 'Secret1'
      fill_in 'Password confirmation', with: 'Secret2'
      click_button 'Sign up'
      expect(page).to have_content 'Password confirmation doesn\'t match Password'
    end
  end
end
