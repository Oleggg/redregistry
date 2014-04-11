# == Schema Information
#
# Table name: card_locations
#
#  id              :integer(4)      not null, primary key
#  card_id         :integer(4)      not null
#  location_id     :integer(4)      not null
#  entrance_date   :date
#  retirement_date :date
#  comment         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class CardLocation < ActiveRecord::Base
  belongs_to :card
  belongs_to :location

  validates_presence_of :card
  validates_presence_of :location

end
