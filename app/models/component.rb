class Component < ApplicationRecord
	has_many :components_projects
	has_many :projects, :through => :components_projects
	belongs_to :component_type
end
