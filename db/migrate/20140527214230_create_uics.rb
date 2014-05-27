class CreateUics < ActiveRecord::Migration
  def self.up
    create_table :uics do |t|
      t.integer :number, :null => false
      t.references :tic, :null => false
      t.string :chairman
      t.integer :electors_number
      t.string :phone
      t.text :note
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :uics
  end
end
