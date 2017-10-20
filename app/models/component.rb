class Component < ApplicationRecord
  has_many :components_projects, inverse_of: :component
  has_many :projects, through: :components_projects
  attr_accessor :amount
  accepts_nested_attributes_for :components_projects
  validates_presence_of :component_type
  enum component_type: %w[Resistor Capacitor IC Transistor Diode Potentiometer
                          Jack Switch Socket Connector]
end
