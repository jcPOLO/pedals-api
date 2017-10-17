FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.word }
    # association :component
    # association :components_project

    # after(:create) { |project| project.components << FactoryGirl.create(:component) }
    # after(:create) do |project|
    #   project.components << FactoryGirl.create(:components)
    # end
  end
end