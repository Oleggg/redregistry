class CreateRelatives < ActiveRecord::Migration
  def self.up
    create_table :relatives do |t|
      t.integer :degree, :null => false, :default => 0
      t.integer :person_id, :null => false
      t.integer :relative_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :relatives
  end
end

