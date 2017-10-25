FactoryGirl.define do
  factory :inventory, class: Project do
    name { Faker::StarWars.character }
    inventory { true }
  end
end