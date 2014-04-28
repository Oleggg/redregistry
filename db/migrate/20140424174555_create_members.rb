class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.references :region_committee, :null => false
      t.text :mission
      t.date :entry_date
      t.string :membershipcard_number, :null => false
      t.string :phone
      t.string :post
      t.string :party_post
      t.boolean :is_distributor, :default => 0
      t.text :note
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
