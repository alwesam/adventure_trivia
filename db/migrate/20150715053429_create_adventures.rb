class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.text :description
      t.boolean :challenge

      t.timestamps null: false
    end
  end
end
