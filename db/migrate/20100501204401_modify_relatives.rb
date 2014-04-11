class ModifyRelatives < ActiveRecord::Migration
  def self.up
    change_table :relatives do |t|
      t.remove :relative_id
      t.remove :degree
      t.references :relationship
      t.references :card
    end
  end

  def self.down
    change_table :relatives do |t|
      t.integer :degree, :null => false
      t.integer :relative_id, :null => false
      t.remove :relationship_id
      t.remove :card_id
    end
  end
end

