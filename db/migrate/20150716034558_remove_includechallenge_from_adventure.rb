class RemoveIncludechallengeFromAdventure < ActiveRecord::Migration
  def change
    remove_column :adventures, :include_challenge, :boolean
  end
end
