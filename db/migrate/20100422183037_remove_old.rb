class RemoveOld < ActiveRecord::Migration
  def self.up
    drop_table :teens
    drop_table :achievments
    drop_table :teen_categories
  end

  def self.down
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

    create_table :achievments do |t|
      t.references :teen
      t.text :content
      t.timestamps
    end

    create_table :teen_categories do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
