class CreateCardCompanies < ActiveRecord::Migration
  def self.up
    create_table :card_companies do |t|
      t.references :card, :null => false
      t.references :company, :null => false
      t.string :period
      t.date :period_from
      t.date :period_to
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :card_companies
  end
end
