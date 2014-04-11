class CreateChildHelps < ActiveRecord::Migration
  def self.up
    create_table :child_helps do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :child_helps
  end
end
