class CreatePrivacyDocumentTypes < ActiveRecord::Migration
  def self.up
    create_table :privacy_document_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :privacy_document_types
  end
end
