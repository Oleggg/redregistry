class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
      t.references :person, :null => false
      t.string :reg_num
      t.date :registered_at
      t.date :unregistered_at
      t.boolean :repeat
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
