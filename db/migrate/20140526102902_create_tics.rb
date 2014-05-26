class CreateTics < ActiveRecord::Migration
  def self.up
    create_table :tics do |t|
      t.string :name, :null => false
      t.string :chief
      t.string :phone
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :tics
  end
end
