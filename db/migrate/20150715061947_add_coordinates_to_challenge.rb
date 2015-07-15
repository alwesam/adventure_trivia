class AddCoordinatesToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :latitude, :float
    add_column :challenges, :longitude, :float
  end
end
