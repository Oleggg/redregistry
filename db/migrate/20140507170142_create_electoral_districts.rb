class CreateElectoralDistricts < ActiveRecord::Migration
  def self.up
    create_table :electoral_districts do |t|
      t.integer :number, :null => false
      t.string :name
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :electoral_districts
  end
end
