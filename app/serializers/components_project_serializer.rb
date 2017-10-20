class ComponentsProjectSerializer < ActiveModel::Serializer
  attributes :id, :amount
  attribute :project do
    object.project.name
  end
  attribute :component do
    object.component.value
  end
end
