class CreateProfessions < ActiveRecord::Migration
  def self.up
    create_table :professions do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :professions
  end
end

