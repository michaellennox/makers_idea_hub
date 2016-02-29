FactoryGirl.define do
  factory :problem do
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
  end
end
