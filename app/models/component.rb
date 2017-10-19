class Component < ApplicationRecord
  has_many :components_projects
  has_many :projects, through: :components_projects
  validates_presence_of :component_type_id
  # attr_accessor :amount
  # attr_reader :amount

  # def amount(project_id)
  #   components_project = ComponentsProject.find_by(
  #     component_id: self, project_id: project_id
  #   )
  #   components_project.amount
  # end


  # def type
  #   component_types_list = ["Resistor", "Capacitor", "IC", "Transistor", 
  #     "Diode", "Potentiometer", "Jack", "Switch", "Socket", "Connector"]
  #   component_types_list[self.component_type_id - 1]
  # end
end
