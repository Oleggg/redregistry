class AddDistrictToHouse < ActiveRecord::Migration
  def self.up
    change_table :houses do |t|
      t.references :district
    end
  end

  def self.down
    change_table :houses do |t|
      t.remove :district_id
    end
  end
end
