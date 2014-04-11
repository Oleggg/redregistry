class AddFamilyStructureToFamily < ActiveRecord::Migration
  def self.up  
    change_table :families do |t|
      t.references :family_structure
    end
  end

  def self.down  
    change_table :families do |t|
      t.remove :family_structure_id
    end
  end
end
