class Project < ApplicationRecord
	has_many :components_projects
	has_many :components, :through => :components_projects # , extend: ComponentAmount
  validates_presence_of :name
end
