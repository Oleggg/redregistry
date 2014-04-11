class CreateCardCategories < ActiveRecord::Migration
  def self.up
    create_table :card_categories do |t|
      t.references :card, :null => false
      t.references :category, :null => false
      t.string :comment
      t.timestamps
    end

    change_table :cards do |t|
      t.remove :category_id
    end
  end

  def self.down
    drop_table :card_categories

    change_table :cards do |t|
      t.integer :category_id
    end
  end
end

