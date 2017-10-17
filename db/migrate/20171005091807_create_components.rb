class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.integer :value
      t.integer :legs
      t.boolean :log
      t.boolean :rev
      t.string  :model
      t.integer :component_type_id

      t.timestamps
    end
  end
end
