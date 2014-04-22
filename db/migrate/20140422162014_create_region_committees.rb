class CreateRegionCommittees < ActiveRecord::Migration
  def self.up
    create_table :region_committees do |t|
      t.string :first_secretary, :null => false
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :region_committees
  end
end
