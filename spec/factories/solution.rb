FactoryGirl.define do
  factory :solution do
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    problem
  end
end
