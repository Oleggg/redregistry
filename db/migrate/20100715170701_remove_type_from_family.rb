class RemoveTypeFromFamily < ActiveRecord::Migration
  def self.up  
    change_table :families do |t|
      t.remove :family_type_id
    end
  end

  def self.down  
      t.references :family_type
  end
end
