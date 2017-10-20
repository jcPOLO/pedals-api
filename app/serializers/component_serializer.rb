class ComponentSerializer < ActiveModel::Serializer
  attributes :id,
             :value,
             :log,
             :rev,
             :model,
             :legs,
             :created_at,
             :updated_at

end
