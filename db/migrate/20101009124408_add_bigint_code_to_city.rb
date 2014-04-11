class AddBigintCodeToCity < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.remove :code
      t.integer :code, :limit => 11, :null => false
    end
    execute 'alter table towns add column code bigint unsigned'
  end

  def self.down
    change_table :cities do |t|
      t.remove :code
    end
  end
end
