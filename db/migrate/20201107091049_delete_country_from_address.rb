class DeleteCountryFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :country_id
  end
end
