FactoryGirl.define do
  factory :components_project do
    amount { Faker::Number.between(11, 40) }
    component
    project
  end
end