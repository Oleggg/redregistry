# == Schema Information
#
# Table name: unregistration_causes
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class UnregistrationCause < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def children_count
    Card.where(:unregistration_cause_id => id).count
  end

  def children_count_period(from,to)
    Card.where("unregistration_cause_id =? and registered_at >=? and registered_at <= ?",id,from,to).count
  end
end
