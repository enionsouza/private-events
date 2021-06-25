require 'rails_helper'

RSpec.describe 'New Event Creation', type: :system do

    describe 'new events page' do 
        it 'rejects request if title is too short' do
            User.create({username:'user001', email:'user001@example.com',password: 'Secret1',password_confirmation: 'Secret1'})   
            visit new_event_path
            fill_in 'Email', with: 'user001@example.com'
            fill_in 'Password', with: 'Secret1'
            click_button 'Log in'
            fill_in 'Title:', with: 'aa'
            fill_in 'Date:',  with: '09092022'
            fill_in 'Where?:', with: 'Somewhere over the rainbow'
            click_button 'Create Event'
            expect(page).to have_content 'Title is too short (minimum is 5 characters)'
        end
        it 'rejects request if date is missing' do
            User.create({username:'user001', email:'user001@example.com',password: 'Secret1',password_confirmation: 'Secret1'})   
            visit new_event_path
            fill_in 'Email', with: 'user001@example.com'
            fill_in 'Password', with: 'Secret1'
            click_button 'Log in'
            fill_in 'Title:', with: 'Valid Title'
            fill_in 'Where?:', with: 'Somewhere over the rainbow'
            click_button 'Create Event'
            expect(page).to have_content 'Date can\'t be blank'
        end
        it 'rejects request if title is missing' do
            User.create({username:'user001', email:'user001@example.com',password: 'Secret1',password_confirmation: 'Secret1'})   
            visit new_event_path
            fill_in 'Email', with: 'user001@example.com'
            fill_in 'Password', with: 'Secret1'
            click_button 'Log in'
            fill_in 'Date:',  with: '09092022'
            fill_in 'Where?:', with: 'Somewhere over the rainbow'
            click_button 'Create Event'
            expect(page).to have_content 'Title can\'t be blank'
        end
        it 'rejects request if location is missing' do
            User.create({username:'user001', email:'user001@example.com',password: 'Secret1',password_confirmation: 'Secret1'})   
            visit new_event_path
            fill_in 'Email', with: 'user001@example.com'
            fill_in 'Password', with: 'Secret1'
            click_button 'Log in'
            fill_in 'Title:', with: 'Valid Title'
            fill_in 'Date:',  with: '09092022'
            click_button 'Create Event'
            expect(page).to have_content 'Location can\'t be blank'
        end
        it 'Shows the event show page if passed' do
            User.create({username:'user001', email:'user001@example.com',password: 'Secret1',password_confirmation: 'Secret1'})   
            visit new_event_path
            fill_in 'Email', with: 'user001@example.com'
            fill_in 'Password', with: 'Secret1'
            click_button 'Log in'
            fill_in 'Title:', with: 'Valid Title'
            fill_in 'Date:',  with: '09092022'
            fill_in 'Where?:', with: 'Somewhere over the rainbow'
            click_button 'Create Event'
            expect(page).to have_css('h1',text: 'Valid Title')
        end
    end
end