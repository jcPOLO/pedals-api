class ComponentsProject < ApplicationRecord
  belongs_to :project     # foreign key - project_id
  belongs_to :component   # foreign key - component_id
  validates_presence_of :amount
  attr_accessor :amount
end
