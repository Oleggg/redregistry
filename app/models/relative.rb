# == Schema Information
#
# Table name: relatives
#
#  id              :integer(4)      not null, primary key
#  person_id       :integer(4)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  relationship_id :integer(4)
#  card_id         :integer(4)
#  cohabitation    :boolean(1)      default(TRUE)
#  address         :string(255)
#  comment         :text
#  birthday        :date
#

class Relative < ActiveRecord::Base
  belongs_to :person
  belongs_to :relationship
  belongs_to :card

  validates_presence_of :relationship
  validates_presence_of :person
  validates_presence_of :card

  accepts_nested_attributes_for :person
end

