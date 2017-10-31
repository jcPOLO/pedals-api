class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.integer :value
      t.integer :legs
      t.boolean :log
      t.boolean :rev
      t.string  :model
      t.string :component_type

      t.timestamps
    end
  end
end
