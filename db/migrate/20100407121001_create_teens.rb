class CreateTeens < ActiveRecord::Migration
  def self.up
    create_table :teens do |t|
      t.references :person, :null => false
      t.references :teen_category
      t.references :profession
      t.string :prof_orientation
      t.string :family_income
      t.string :health
      t.text :psycho_characteristic
      t.text :family_characteristic
      t.timestamps
    end
  end

  def self.down
    drop_table :teens
  end
end

