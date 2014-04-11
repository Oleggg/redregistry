class ModifyConvictions < ActiveRecord::Migration
  def self.up
    change_table :convictions do |t|
      t.remove :article
      t.references :cc_article
    end
  end

  def self.down
    change_table :convictions do |t|
      t.string :article
      t.remove :cc_article_id
    end
  end
end
