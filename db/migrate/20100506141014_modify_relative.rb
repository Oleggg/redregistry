class ModifyRelative < ActiveRecord::Migration
  def self.up
    add_column :relationships, :gender, :integer, :default => 0

    change_table :relatives do |t|
      t.boolean :cohabitation, :default => true
      t.string :address
      t.text :comment
    end
  end

  def self.down
    remove_column :relationships, :gender

    change_table :relatives do |t|
      t.remove :cohabitation
      t.remove :address
      t.remove :comment
    end
  end
end

