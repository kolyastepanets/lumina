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
      click_button I18n.t('subscriber.submit')

      expect(page).to have_content I18n.t('subscriber.subscription_created')
      open_email(subscriber.email)
      expect(current_email).to have_content I18n.t('mailer.subscription.thank_you')
    end

    scenario 'fail send request' do
      fill_in 'subscriber_name', with: subscriber.name
      click_button I18n.t('subscriber.submit')

      expect(page).to have_content I18n.t('errors.format', attribute: 'Email',
                                                           message: I18n.t('errors.messages.blank'))
    end
  end

  describe 'search' do
    let!(:articles) { create_list(:article, 10) }
    let(:first_article) { Article.last }

    scenario 'success' do
      fill_in 'search_text', with: first_article.description.split.second
      page.execute_script("$('form#search-form').submit()")

      expect(page).to have_content I18n.t(
        'articles.search_results', results: first_article.description.split.second
      )
      expect(page).to have_content first_article.title
    end
  end

  describe 'according to category' do
    let!(:category) { create(:category_for_blog) }
    let!(:another_category) { create(:category_for_blog, title: 'test') }
    let!(:article) { create(:article) }
    let!(:another_article) { create(:article) }

    before do
      article.categories << category
      another_article.categories << another_category
    end

    scenario 'see articles' do
      within '.container-right' do
        click_link category.title
      end

      expect(page).to have_content article.title
      expect(page).to_not have_content another_article.title
    end
  end
end
