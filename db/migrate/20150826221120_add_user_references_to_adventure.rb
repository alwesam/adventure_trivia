class AddUserReferencesToAdventure < ActiveRecord::Migration
  def change
    add_reference :adventures, :user, index: true, foreign_key: true
  end
end
