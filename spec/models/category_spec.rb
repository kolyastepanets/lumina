require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Association' do
    it { should have_many(:albulms) }
    it { should have_many(:category_articles).dependent(:destroy) }
    it { should have_many(:articles).through(:category_articles) }

    it { should accept_nested_attributes_for(:category_articles) }
  end

  context 'Validation' do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:classification) }
  end
end
