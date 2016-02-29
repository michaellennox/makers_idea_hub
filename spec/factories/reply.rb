FactoryGirl.define do
  factory :reply do
    body { Faker::Hipster.paragraph }
    solution
  end
end
