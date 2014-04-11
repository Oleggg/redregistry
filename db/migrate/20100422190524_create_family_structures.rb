class CreateFamilyStructures < ActiveRecord::Migration
  def self.up
    create_table :family_structures do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :family_structures
  end
end
