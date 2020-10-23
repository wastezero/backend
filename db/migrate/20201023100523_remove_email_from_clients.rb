class RemoveEmailFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :email, :string
  end
end
