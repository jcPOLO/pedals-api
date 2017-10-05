class Project < ApplicationRecord
	has_many :componentsprojects
	has_many :components, :through => :componentsprojects
end
