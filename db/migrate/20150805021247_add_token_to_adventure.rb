class AddTokenToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :token, :string
  end
end
