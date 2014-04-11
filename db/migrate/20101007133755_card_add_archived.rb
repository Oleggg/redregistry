class CardAddArchived < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.boolean :is_archived
    end
  end

  def self.down
    change_table :cards do |t|
      t.remove :is_archived
    end
  end
end
