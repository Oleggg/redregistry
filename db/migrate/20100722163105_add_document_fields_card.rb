class AddDocumentFieldsCard < ActiveRecord::Migration
  def self.up  
    change_table :cards do |t|
      t.integer :release_cause
      t.date :passport_serie
      t.date :passport_num
      t.text :issued_by
      t.date :issued_at
      t.string :pension_cert_num
    end
  end

  def self.down  
    change_table :cards do |t|
      t.remove :passport_serie
      t.remove :passport_num
      t.remove :issued_by
      t.remove :issued_at
      t.remove :release_cause
      t.remove :pension_cert_num
    end
  end
end
