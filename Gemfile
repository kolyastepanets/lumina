source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.5'
gem 'font-awesome-rails'
gem 'figaro'
gem 'instagram-continued', require: 'instagram'
gem 'activeadmin'
gem 'devise'
gem 'friendly_id', '~> 5.1.0'
gem 'active_skin'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'fog'
gem 'translit'
gem 'select2-rails'
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2'
gem 'social-share-button'
gem 'pg_search'
gem 'rails-i18n', '~> 5.0.0'
gem 'ckeditor'
gem 'active_admin_jcrop'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'mailgun_rails'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'acts_as_list'
gem 'browser'
gem 'autoprefixer-rails'
gem 'sidekiq'
gem 'sidekiq-cron', '~> 0.6.3'
gem 'rufus-scheduler', '~> 3.4.2'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  gem 'bullet'
  gem 'listen'
  gem 'rubocop', require: false
  gem 'brakeman', require: false
  gem 'rubycritic', require: false
  gem 'overcommit'
  gem 'rails_best_practices'
  gem 'traceroute'
end

group :test do
  gem 'launchy'
  gem 'capybara-email'
  gem 'capybara-selenium'
  gem 'capybara-screenshot'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end
