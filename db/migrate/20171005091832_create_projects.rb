class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.boolean :inventory, default: false, null: false

      t.timestamps
    end
  end
end
