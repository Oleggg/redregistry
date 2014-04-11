class AddBirthdateRelatives < ActiveRecord::Migration
  def self.up  
    change_table :relatives do |t|
      t.date :birthday
    end
  end

  def self.down  
    change_table :relatives do |t|
      t.remove :birthday
    end
  end
end
