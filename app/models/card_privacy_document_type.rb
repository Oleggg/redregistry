# == Schema Information
#
# Table name: card_privacy_document_types
#
#  id                       :integer(4)      not null, primary key
#  card_id                  :integer(4)      not null
#  privacy_document_type_id :integer(4)
#  name                     :string(255)
#  reg_num                  :string(255)
#  registered_at            :date
#  comment                  :text
#  created_at               :datetime
#  updated_at               :datetime
#

class CardPrivacyDocumentType < ActiveRecord::Base
  belongs_to :card
  belongs_to :privacy_document_type

  validates_presence_of :name
  validates_presence_of :card
  validates_presence_of :privacy_document_type

end
