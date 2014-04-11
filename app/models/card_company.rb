# == Schema Information
#
# Table name: card_companies
#
#  id          :integer(4)      not null, primary key
#  card_id     :integer(4)      not null
#  company_id  :integer(4)      not null
#  period      :string(255)
#  period_from :date
#  period_to   :date
#  comment     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class CardCompany < ActiveRecord::Base
  belongs_to :card
  belongs_to :company

  validates_presence_of :card
  validates_presence_of :company
end
