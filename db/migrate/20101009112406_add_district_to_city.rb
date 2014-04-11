class AddDistrictToCity < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.references :district
    end
  end

  def self.down
    change_table :cities do |t|
      t.remove :district_id
    end
  end
end
