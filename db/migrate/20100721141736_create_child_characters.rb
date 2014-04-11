class CreateChildCharacters < ActiveRecord::Migration
  def self.up
    create_table :child_characters do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :child_characters
  end
end
