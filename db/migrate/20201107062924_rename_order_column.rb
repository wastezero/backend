class RenameOrderColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :overdue_date, :deadline
    rename_column :orders, :expiration_time, :expires_at
  end
end
