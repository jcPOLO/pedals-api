class Component < ApplicationRecord
  attr_accessor :amount
  enum component_type: %w[Resistor Capacitor IC Transistor Diode Potentiometer
                          Jack Switch Socket Connector]
  has_many :components_projects, inverse_of: :component
  has_many :projects, through: :components_projects
  validates :component_type, presence: true
  # before_save :callback
  # devise macros here

  # Use the friendly_id gem. It allows creation of human-readable URLs by using
  # some descriptive attribute of the model instead of its id.
  # class Person
  #   extend FriendlyId
  #   friendly_id :name, use: :slugged
  # end
end
