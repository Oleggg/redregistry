class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.references :region_committee, :null => false
      t.text :mission, :null => false
      t.date :entry_date
      t.string :membershipcard_number, :null => false
      t.string :phone
      t.string :post
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
