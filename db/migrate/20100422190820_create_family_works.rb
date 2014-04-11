class CreateFamilyWorks < ActiveRecord::Migration
  def self.up
    create_table :family_works do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :family_works
  end
end
