# == Schema Information
#
# Table name: card_child_characters
#
#  id                 :integer(4)      not null, primary key
#  card_id            :integer(4)      not null
#  child_character_id :integer(4)      not null
#  comment            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class CardChildCharacter < ActiveRecord::Base
  belongs_to :card
  belongs_to :child_character

  validates_presence_of :card
  validates_presence_of :child_character

end
