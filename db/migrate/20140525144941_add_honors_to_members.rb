class AddHonorsToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.string :honors
    end
  end

  def self.down
    change_table :members do |t|
      t.remove :honors
    end
  end
end
