class RemoveRiddleFromChallenge < ActiveRecord::Migration
  def change
    remove_column :challenges, :riddle, :text
    remove_column :challenges, :riddle_answer, :string
    remove_column :challenges, :riddle_hint, :string
  end
end
