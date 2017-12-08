require 'rails_helper'

RSpec.describe Albulm, type: :model do
  context 'Association' do
    it { should belong_to(:category) }
    it { should have_many(:images) }
  end

  context 'Validation' do
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:title_photo) }

    context 'english slug format' do
      correct_slugs = %w[photozone candybar wedding]
      wrong_slugs = %w[101 Joh&n St*ar Кириллический Слаг]

      correct_slugs.each do |name|
        it do
          should allow_value(name).for(:slug)
        end
      end

      wrong_slugs.each do |name|
        it do
          should_not allow_value(name).for(:slug)
        end
      end
    end
  end
end
