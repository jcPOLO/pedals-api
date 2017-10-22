class Component < ApplicationRecord
  attr_accessor :amount
  enum component_type: %w[Resistor Capacitor IC Transistor Diode Potentiometer
                          Jack Switch Socket Connector]
  has_many :components_projects
  has_many :projects, through: :components_projects

  accepts_nested_attributes_for :components_projects, allow_destroy: true


  NIL_ATTRIBUTES = %w(model value legs log rev)
  before_validation :nil_if_blank

  validates :component_type, presence: true
  validates :value, presence: true, if: :validates_value
  # validates :model, presence: true, if: :validates_model
  # validates :legs, presence: true, if: :validates_legs

  # before_save :callback
  # devise macros here

  # Use the friendly_id gem. It allows creation of human-readable URLs by using
  # some descriptive attribute of the model instead of its id.
  # class Person
  #   extend FriendlyId
  #   friendly_id :name, use: :slugged
  # end

  def validates_value
    self.component_type === 'Resistor' || nil
  end

  # def validates_model
  #   num = self.component_type
  #   num.between?(3,5) || num.between?(7,10) unless num.nil?
  # end

  # def validates_legs
  #   self.component_type === 3 || self.component_type === 9
  # end

  # def validates_potentiometer
  #   self.component_type === 6
  # end

  def nil_if_blank
    NIL_ATTRIBUTES.each { |attr| self[attr] = nil if self[attr].blank? }
  end

  # def resistor_value_format
  #   value_s = clean_input_value(self.value)
  #   if value_s.match(/\dk\d$/)      # if resistor is in decimal K format (1K8, 4k6, etc.)
  #     value_s.remove('k').to_i * 100
  #   elsif value_s.match(/\d+k$/)        # if resistor is in K format
  #     value_s.remove('k').to_i * 1000
  #   elsif value_s.match(/\d+m$/)        # if resistor is in Mega format
  #     value_s.remove('m').to_i * 1000000
  #   elsif value_s.match(/\d+o?$/)        # if resistor is in Ohm
  #     value_s.to_i
  #   else
  #     raise 'resistor value format not valid!'
  #   end
  # end

  # def capacitor_value_format
  #   value_s = clean_input_value(self.value)
  #   if value_s.match(/\dk\d$/)      # if resistor is in decimal K format (1K8, 4k6, etc.)
  #     value_s.remove('k').to_i * 100
  #   elsif value_s.match(/\d+k$/)        # if resistor is in K format
  #     value_s.remove('k').to_i * 1000
  #   elsif value_s.match(/\d+m$/)        # if resistor is in Mega format
  #     value_s.remove('m').to_i * 1000000
  #   elsif value_s.match(/\d+o?$/)        # if resistor is in Ohm
  #     value_s.to_i
  #   else
  #     raise 'resistor value format not valid!'
  #   end
  # end

  # private

  # def clean_input_value(value)
  #   value_s = value.to_s.downcase
  #   value_s.gsub(/\s+/,'')      # valueS.delete(' ').delete('\t').delete('\n')...
  # end
end
