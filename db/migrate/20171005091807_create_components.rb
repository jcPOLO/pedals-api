class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.integer :value
      t.integer :legs
      t.integer :log
      t.integer :rev
      t.string  :model

      t.timestamps
    end
  end
end
