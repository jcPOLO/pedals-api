class AddIdToComponentsProject < ActiveRecord::Migration[5.1]
  def change
    add_column :components_projects, :id, :primary_key
  end
end
