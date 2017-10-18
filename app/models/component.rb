class Component < ApplicationRecord
	has_many :components_projects
	has_many :projects, :through => :components_projects
  validates_presence_of :component_type_id
  # attr_accessor :amount
  # attr_reader :amount

  # def components_for_project(project_id)
  #   c = ComponentsProject.find_by(project_id: project_id)
  #   c.find_by(component_id: self.id).amount
  # end

  # def type
  #   component_types_list = ["Resistor", "Capacitor", "IC", "Transistor", 
  #     "Diode", "Potentiometer", "Jack", "Switch", "Socket", "Connector"]
  #   component_types_list[self.component_type_id - 1]
  # end
end
