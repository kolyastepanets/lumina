require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'Association' do
    it { should belong_to(:albulm) }
  end

  context 'Validation' do
    it { should validate_presence_of(:file) }
  end
end
