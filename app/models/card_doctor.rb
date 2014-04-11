# == Schema Information
#
# Table name: card_doctors
#
#  id           :integer(4)      not null, primary key
#  card_id      :integer(4)      not null
#  doctor_id    :integer(4)      not null
#  registration :date
#  comment      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class CardDoctor < ActiveRecord::Base
  belongs_to :card
  belongs_to :doctor

  validates_presence_of :card
  validates_presence_of :doctor

end
