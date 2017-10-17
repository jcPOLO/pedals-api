FactoryGirl.define do
  factory :component do
    component_type { Faker::Number.between(1,6) }
    model {Faker::StarWars.character }
  end
end
