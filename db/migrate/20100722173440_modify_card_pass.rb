class ModifyCardPass < ActiveRecord::Migration
  def self.up  
    change_table :cards do |t|
      t.remove :passport_serie
      t.integer :passport_serie
      t.remove :passport_num
      t.string :passport_num
    end
  end

  def self.down  
  end
end
