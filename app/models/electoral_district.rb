class ElectoralDistrict < ActiveRecord::Base
  has_many :streets

  scope :sorted, order("number")


end
