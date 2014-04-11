class CreateCardPrivacyDocumentTypes < ActiveRecord::Migration
  def self.up
    create_table :card_privacy_document_types do |t|
      t.references :card, :null => false
      t.references :privacy_document_type, :null => false
      t.string :name
      t.string :reg_num
      t.date :registered_at
      t.integer :privacy_document_type_id
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :card_privacy_document_types
  end
end

