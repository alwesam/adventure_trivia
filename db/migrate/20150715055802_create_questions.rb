class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.string :answer
      t.references :challenge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
