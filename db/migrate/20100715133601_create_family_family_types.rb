class CreateFamilyFamilyTypes < ActiveRecord::Migration
  def self.up
    create_table :family_family_types do |t|
      t.references :family, :null => false
      t.references :family_type, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :family_family_types
  end
end
