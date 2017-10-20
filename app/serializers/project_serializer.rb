class ProjectSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :inventory, # TODO, to be removed, maybe.
             :created_at,
             :updated_at
end
