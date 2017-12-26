require 'rails_helper'

feature 'Blog', js: true do
  let!(:subscriber) { build(:subscriber) }

  background do
    visit root_path
    click_link 'Блог'
  end

  describe 'subscribe on newsletter' do
    scenario 'success send request' do
      fill_in 'subscriber_email', with: subscriber.email
      fill_in 'subscriber_name', with: subscriber.name
      click_button 'Подписаться'

      expect(page).to have_content 'Спасибо за подписку!'
      open_email(subscriber.email)
      expect(current_email).to have_content(
        'Спасибо за подписку, здесь мы будем делиться с вами нашими идеями, новостями.'
      )
    end

    scenario 'fail send request' do
      fill_in 'subscriber_email', with: subscriber.email
      click_button 'Подписаться'

      expect(page).to have_content 'Name can\'t be blank'
    end
  end

  describe 'search' do
    let!(:articles) { create_list(:article, 10) }
    let(:first_article) { Article.last }

    scenario 'success' do
      fill_in 'search_text', with: first_article.description.split.second
      page.execute_script("$('form#search-form').submit()")

      expect(page).to have_content "Результаты по поиску: #{first_article.description.split.second}"
      expect(page).to have_content first_article.title
    end
  end
end
