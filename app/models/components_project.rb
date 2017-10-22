class ComponentsProject < ApplicationRecord
  belongs_to :project#,   inverse_of: :components_projects # foreign key - project_id
  belongs_to :component#, inverse_of: :components_projects # foreign key - component_id
  # validates_presence_of :amount
end
