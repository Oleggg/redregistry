class CreateCardChildCharacters < ActiveRecord::Migration
  def self.up
    create_table :card_child_characters do |t|
      t.references :card, :null => false
      t.references :child_character, :null => false
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :card_child_characters
  end
end
