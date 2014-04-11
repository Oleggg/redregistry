class CreateAchievments < ActiveRecord::Migration
  def self.up
    create_table :achievments do |t|
      t.references :teen
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :achievments
  end
end

