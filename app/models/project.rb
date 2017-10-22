class Project < ApplicationRecord
  has_many :components_projects, dependent: :destroy
  has_many :components, through: :components_projects
  validates :name, presence: true, uniqueness: true, length: { maximum: 25 }

  def amounts(component)
    if component.class.to_s == 'Component'
      component.amount = components_projects.find_by(
        component_id: component
      ).amount
    else
      a_components = []
      component.find_each do |c|
        c.amount = components_projects.find_by(
          component_id: c
        ).amount
        a_components << c
      end
      component = a_components
    end
    component
  end
end
