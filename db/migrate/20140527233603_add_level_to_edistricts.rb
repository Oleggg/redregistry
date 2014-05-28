class AddLevelToEdistricts < ActiveRecord::Migration
  def self.up
    change_table :electoral_districts do |t|
      t.integer :shipping_type
    end
  end

  def self.down
    change_table :electoral_districts do |t|
      t.remove :shipping_type_id
    end
  end
end
