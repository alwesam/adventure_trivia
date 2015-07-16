class RemoveChallengeFromAdventure < ActiveRecord::Migration
  def change
    remove_column :adventures, :challenge, :boolean
  end
end
