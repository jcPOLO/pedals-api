class Component < ApplicationRecord
	has_many :components_projects
	has_many :projects, :through => :components_projects
	belongs_to :component_type

  def type
    component_type && component_type.name
  end
end
