class CreateCardFamilyHelps < ActiveRecord::Migration
  def self.up
    create_table :card_family_helps do |t|
      t.references :family_help, :null => false
      t.date :help_date
      t.integer :organization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :card_family_helps
  end
end
