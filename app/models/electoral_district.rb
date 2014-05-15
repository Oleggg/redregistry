class ElectoralDistrict < ActiveRecord::Base
  has_many :streets
  has_many :houses

  accepts_nested_attributes_for :streets
  accepts_nested_attributes_for :houses

  scope :sorted, order("number")


end
