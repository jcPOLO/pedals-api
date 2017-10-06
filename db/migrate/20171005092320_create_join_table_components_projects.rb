class CreateJoinTableComponentsProjects < ActiveRecord::Migration[5.1]
  def change
    create_join_table :components, :projects do |t|
      t.index [:component_id, :project_id]
      t.index [:project_id, :component_id]
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
