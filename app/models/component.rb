class Component < ApplicationRecord
	has_many :componentsprojects
	has_many :projects, :through => :componentsprojects
	belongs_to :component_type
end
