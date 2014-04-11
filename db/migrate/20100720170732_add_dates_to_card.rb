class AddDatesToCard < ActiveRecord::Migration
  def self.up  
    change_table :cards do |t|
      t.date :convicted_at
      t.date :released_at
    end   
  end

  def self.down  
    change_table :cards do |t|
      t.remove :convicted_at
      t.remove :released_at
    end   
  end
end
