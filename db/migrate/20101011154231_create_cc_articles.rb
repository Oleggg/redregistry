class CreateCcArticles < ActiveRecord::Migration
  def self.up
    create_table :cc_articles do |t|
      t.string :number, :null => false
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :cc_articles
  end
end
