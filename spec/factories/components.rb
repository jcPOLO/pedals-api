FactoryGirl.define do
  factory :component do
    component_type_id { Faker::Number.between(1,9) }
  end
end
