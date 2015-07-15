class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :location
      t.text :riddle
      t.string :riddle_answer
      t.string :riddle_hint
      t.references :adventure, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
