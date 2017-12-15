require 'rails_helper'

feature 'Contact request', js: true do
  let!(:contact_request) { build(:contact_request) }

  background do
    visit root_path
    click_link 'Контакты'
  end

  scenario 'success send request' do
    fill_in 'contact_request_name', with: contact_request.name
    fill_in 'contact_request_email', with: contact_request.email
    fill_in 'contact_request_subject', with: contact_request.subject
    fill_in 'contact_request_body', with: contact_request.body
    click_button 'Отправить'

    expect(page).to have_content 'Спасибо за сообщение!'
  end

  scenario 'fail send request' do
    fill_in 'contact_request_name', with: contact_request.name
    click_button 'Отправить'

    expect(page).to have_content 'Заполните все поля пожалуйста'
  end
end
