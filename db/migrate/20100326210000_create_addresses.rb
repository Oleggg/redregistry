class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :name
      t.string :country
      t.string :region
      t.string :city
      t.string :post_code
      t.string :address_line
      t.integer :addressable_id, :null => false
      t.string :addressable_type, :null => false, :limit => 20
      t.timestamps
    end
    add_index :addresses, :address_line
    add_index :addresses, [:addressable_id, :addressable_type]
  end

  def self.down
    drop_table :addresses
  end
end
