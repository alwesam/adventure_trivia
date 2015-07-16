class AddIncludefinalToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :include_final, :boolean
  end
end
