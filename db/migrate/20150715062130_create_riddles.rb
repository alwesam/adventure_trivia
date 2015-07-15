class CreateRiddles < ActiveRecord::Migration
  def change
    create_table :riddles do |t|
      t.text :content
      t.string :solution
      t.string :hint

      t.timestamps null: false
    end
  end
end
