FactoryGirl.define do
  factory :category_for_blog, class: Category do
    title do
      [
        'colour trends',
        'corporate',
        'engagement',
        'freebies',
        'identity',
        'illustration',
        'pattern',
        'prints',
        'stationery',
        'styled shoot',
        'tips & tricks',
        'typography',
        'website',
        'wedding'
      ].sample
    end
    slug { Faker::Lorem.word }
    classification 'blog'
  end

  factory :category_for_portfolio, class: Category do
    title { %w[IDENTITIES ILLUSTRATION OTHER WEDDINGS].sample }
    slug { Faker::Lorem.word }
    classification 'portfolio'
  end
end
