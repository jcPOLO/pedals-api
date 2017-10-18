FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.word }
    # after(:create) { |project| project.components << FactoryGirl.create(:component) }
    # after(:create) do |project|
    #   project.components << FactoryGirl.create(:components)
    # end
  end
end