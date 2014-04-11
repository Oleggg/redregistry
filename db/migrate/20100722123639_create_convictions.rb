class CreateConvictions < ActiveRecord::Migration
  def self.up
    create_table :convictions do |t|
      t.date :convicted_at
      t.string :article
      t.integer :term
      t.date :released_at
      t.string :release_cause
      t.text :comment      
      t.timestamps
    end
  end

  def self.down
    drop_table :convictions
  end
end
