class AddLevelToEdistricts < ActiveRecord::Migration
  def self.up
    change_table :electoral_districts do |t|
      t.integer :level
    end
  end

  def self.down
    change_table :electoral_districts do |t|
      t.remove :level
    end
  end
end
