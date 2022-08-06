class AddAddressColumnsToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_column :costumes, :street, :string
    add_column :costumes, :city, :string
  end
end
