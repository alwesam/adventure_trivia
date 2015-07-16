class RemoveLocationFromChallenge < ActiveRecord::Migration
  def change
    remove_column :challenges, :location, :string
  end
end
