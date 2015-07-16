class AddAddressToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :address, :string
  end
end
