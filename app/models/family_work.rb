# == Schema Information
#
# Table name: family_works
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FamilyWork < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")
end
