# == Schema Information
#
# Table name: card_family_helps
#
#  id              :integer(4)      not null, primary key
#  family_help_id  :integer(4)      not null
#  help_date       :date
#  organization_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  card_id         :integer(4)
#

class CardFamilyHelp < ActiveRecord::Base
  belongs_to :card
  belongs_to :family_help
  belongs_to :department

  validates_presence_of :card
  validates_presence_of :family_help

end
