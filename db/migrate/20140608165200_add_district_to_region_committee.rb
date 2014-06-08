class AddDistrictToRegionCommittee < ActiveRecord::Migration
  def self.up
    change_table :region_committees do |t|
      t.references :district
    end
  end

  def self.down
    change_table :region_committees do |t|
      t.remove :district_id
    end
  end
end
