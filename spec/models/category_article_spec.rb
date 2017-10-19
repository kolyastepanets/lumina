require 'rails_helper'

RSpec.describe CategoryArticle, type: :model do
  context 'Association' do
    it { should belong_to(:article) }
    it { should belong_to(:category) }
  end
end
