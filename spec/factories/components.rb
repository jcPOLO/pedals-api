FactoryGirl.define do
  factory :component do
    component_type_id { Faker::Number.between(1,9) }
    # after(:create) { |c| project.components << FactoryGirl.create(:components_project) }
  end
end
