# == Schema Information
#
# Table name: card_registration_causes
#
#  id                    :integer(4)      not null, primary key
#  card_id               :integer(4)      not null
#  registration_cause_id :integer(4)      not null
#  comment               :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class CardRegistrationCause < ActiveRecord::Base
  belongs_to :card
  belongs_to :registration_cause

  validates_presence_of :card
  validates_presence_of :registration_cause
end

