class AddReferenceToRiddle < ActiveRecord::Migration
  def change
    add_reference :riddles, :challenge, index: true, foreign_key: true
  end
end
