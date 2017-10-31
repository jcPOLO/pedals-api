class ComponentsProject < ApplicationRecord
  belongs_to :project     # foreign key - project_id
  belongs_to :component   # foreign key - component_id
  validates :amount, presence: true, numericality: 0..1000

  # def autosave_associated_records_for_component
  #   @component_found = Component.find_or_create_by(
  #     value: self.component[:value],
  #     component_type: self.component[:component_type],
  #     model: self.component[:model],
  #     legs: self.component[:legs],
  #     log: self.component[:log],
  #     rev: self.component[:rev]
  #   )
  #   self.component_id ||= @component_found.id
  # end
end
