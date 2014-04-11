class AddFamilyTypeToFamily < ActiveRecord::Migration
  def self.up  
    change_table :families do |t|
      t.references :family_type
    end
  end

  def self.down  
    change_table :families do |t|
      t.remove :family_type_id
    end
  end
end
