class Project < ApplicationRecord
  has_many :components_projects
  has_many :components, through: :components_projects
  validates_presence_of :name

  def amounts
    # Get in an object all components amount for a project
    ComponentsProject.where(project_id: self)
  end
end
