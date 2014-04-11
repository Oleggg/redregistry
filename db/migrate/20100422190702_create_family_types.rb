class CreateFamilyTypes < ActiveRecord::Migration
  def self.up
    create_table :family_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :family_types
  end
end
