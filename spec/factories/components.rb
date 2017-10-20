FactoryGirl.define do
  factory :component do
    component_type {
      %w[Resistor Capacitor IC Transistor Diode Potentiometer
         Jack Switch Socket Connector].sample
    }
  end
end
