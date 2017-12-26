require 'rails_helper'

feature 'Contact request', js: true do
  let!(:contact_request) { build(:contact_request) }

  background do
    clear_emails
    visit root_path
    click_link 'Контакты'
  end

  scenario 'success send request' do
    fill_in 'contact_request_name', with: contact_request.name
    fill_in 'contact_request_email', with: contact_request.email
    fill_in 'contact_request_subject', with: contact_request.subject
    fill_in 'contact_request_body', with: contact_request.body
    click_button I18n.t('button.send')

    expect(page).to have_content I18n.t('contact_request.success_created')
    open_email(Figaro.env.gmail_receiver)
    expect(current_email).to have_content contact_request.body
  end

  scenario 'fail send request' do
    fill_in 'contact_request_name', with: contact_request.name
    click_button I18n.t('button.send')

    expect(page).to have_content I18n.t('contact_request.fail_create')
  end
end
