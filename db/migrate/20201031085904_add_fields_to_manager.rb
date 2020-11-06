class AddFieldsToManager < ActiveRecord::Migration[5.2]
  def change
    add_column :managers, :status, :string
  end
end
