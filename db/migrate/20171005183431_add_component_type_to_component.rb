class AddComponentTypeToComponent < ActiveRecord::Migration[5.1]
  def change
    add_reference :components, :component_type, foreign_key: true
  end
end
