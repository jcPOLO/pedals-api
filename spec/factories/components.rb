FactoryGirl.define do
  factory :component do
    component_type {
      %w[Resistor Capacitor IC Transistor Diode Potentiometer
         Jack Switch Socket Connector].sample
    }
    value { Faker::Number.between(1000, 2000) }
    model { Faker::LeagueOfLegends.champion }
    legs { Faker::Number.between(2, 20) }

    #
    # case component_type
    # when component_type.in?(%w[Resistor Capacitor Potentiometer])
    #   value { Faker::Number.between(1000, 2000)}
    # when component_type.in?(%w[IC Transistor Diode])
    #   model { Faker::Movie.name }
    # when component_type.in?(%w[IC Socket])
    #   legs { Faker::Number.between(2, 20)}
    # end
  end
end
