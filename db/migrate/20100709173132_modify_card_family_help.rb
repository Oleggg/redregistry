class ModifyCardFamilyHelp < ActiveRecord::Migration
  def self.up  
    change_table :card_family_helps do |t|
      t.references :card
    end
  end

  def self.down  
    change_table :card_family_helps do |t|
      t.remove :card_id
    end
  end
end
