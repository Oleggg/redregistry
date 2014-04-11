class CreateCardDoctors < ActiveRecord::Migration
  def self.up
    create_table :card_doctors do |t|
      t.references :card, :null => false
      t.references :doctor, :null => false
      t.date :registration
      t.string :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :card_doctors
  end
end
