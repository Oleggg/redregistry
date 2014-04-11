# == Schema Information
#
# Table name: card_child_helps
#
#  id              :integer(4)      not null, primary key
#  child_help_id   :integer(4)      not null
#  help_date       :date
#  organization_id :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  card_id         :integer(4)
#

class CardChildHelp < ActiveRecord::Base

  belongs_to :card
  belongs_to :child_help

  validates_presence_of :card
  validates_presence_of :child_help

end
