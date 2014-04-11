class CreateTeenCategories < ActiveRecord::Migration
  def self.up
    create_table :teen_categories do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :teen_categories
  end
end

