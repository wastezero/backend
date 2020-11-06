class AddClientIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :client_id, :integer
  end
end
