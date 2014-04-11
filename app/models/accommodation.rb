# == Schema Information
#
# Table name: accommodations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Accommodation < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def children_count
    Card.where(:accommodation_id => id).count
  end

  def families_count
    Card.where(:accommodation_id => id).count("distinct family_id")
  end

end
