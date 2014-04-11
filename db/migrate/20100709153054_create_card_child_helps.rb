class CreateCardChildHelps < ActiveRecord::Migration
  def self.up
    create_table :card_child_helps do |t|
      t.references :child_help, :null => false
      t.date :help_date
      t.integer :organization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :card_child_helps
  end
end
