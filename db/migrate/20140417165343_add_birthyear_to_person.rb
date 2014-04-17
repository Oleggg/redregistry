class AddBirthyearToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.integer :birthyear, :null => true
    end
  end

  def self.down
    change_table :people do |t|
      t.remove :birthyear
    end
  end
end
