class RemoveTitleFromAdventure < ActiveRecord::Migration
  def change
    remove_column :adventures, :name, :string
  end
end
