class Component < ApplicationRecord
  has_many :components_projects, inverse_of: :component
  has_many :projects, through: :components_projects
  accepts_nested_attributes_for :components_projects
  validates_presence_of :component_type_id
  attr_accessor :amount
  attr_reader :amount

  # def amount(project_id)
  #   components_project = ComponentsProject.find_by(
  #     component_id: self, project_id: project_id
  #   )
  #   components_project.amount
  # end
end
