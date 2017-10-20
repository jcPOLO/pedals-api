class ComponentSerializer < ActiveModel::Serializer
  attributes :id,
             :type,
             :component_type_id, # TODO, to be removed.
             :amount,
             :value,
             :log,
             :rev,
             :model,
             :legs,
             :created_at,
             :updated_at

  def type
    component_types_list = %w[Resistor Capacitor IC Transistor Diode Potentiometer
                              Jack Switch Socket Connector]
    component_types_list[object.component_type_id - 1]
  end
end