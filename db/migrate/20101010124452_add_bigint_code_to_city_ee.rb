class AddBigintCodeToCityEe < ActiveRecord::Migration
  def self.up
    change_table :cities do |t|
      t.remove :code
    end
    execute 'alter table cities add column code bigint unsigned'
  end

  def self.down
    change_table :cities do |t|
      t.remove :code
    end
  end
end
