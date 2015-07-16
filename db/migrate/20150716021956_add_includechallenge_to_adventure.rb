class AddIncludechallengeToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :include_challenge, :boolean
  end
end
