FactoryGirl.define do
  factory :component do
    component_type { Faker::Number.between(1, 9) }
  end
end
