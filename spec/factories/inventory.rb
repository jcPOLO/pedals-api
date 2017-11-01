FactoryGirl.define do
  factory :inventory, class: Project do
    name { Faker::Simpsons.character }
    inventory { true }
  end
end