class ModifyMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :middle_name
    end
  end

  def self.down
    change_table :members do |t|
      t.remove :first_name, :null => false
      t.remove :last_name, :null => false
      t.remove :middle_name
    end
  end
end
