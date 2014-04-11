class ModifyConviction < ActiveRecord::Migration
  def self.up  
    change_table :convictions do |t|
      t.references :card
      t.remove :release_cause
      t.integer :release_cause
    end
  end

  def self.down  
    change_table :convictions do |t|
      t.remove :card_id
      t.remove :release_cause
      t.string :release_cause
    end
  end
end
