class ComponentSerializer < ActiveModel::Serializer
  attributes :id,
             :type,
             :amount,
             :value,
             :log,
             :rev,
             :model,
             :legs,
             :created_at,
             :updated_at

  # has_many :components_projects

  def type
    component_types_list = %w[Resistor Capacitor IC Transistor Diode Potentiometer
                              Jack Switch Socket Connector]
    component_types_list[object.component_type_id - 1]
  end

  # def amount
  #   object.components_projects.second.amount
  # end

  def add_amount(amount = 0)
    json_component = object.to_json
    hash_component = JSON.parse(json_component)
    hash_component[:amount] = amount
    component_final = hash_component
    json_response component_final
  end


end
