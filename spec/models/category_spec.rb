require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Association' do
    it { should have_many(:albulms) }
  end

  context 'Validation' do
    it { should validate_presence_of(:title) }
  end
end
