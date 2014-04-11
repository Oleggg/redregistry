# == Schema Information
#
# Table name: employment_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EmploymentType < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :card

  scope :sorted, order("name")

  def children_count
    Card.joins(:employment_type).where(:cards => { :employment_type_id => id }).count
  end

  def families_count
    Family.joins(:cards).where(:cards => { :employment_type_id => id }).count
  end

  def children_count_period(from,to)
    Card.joins(:employment_type).where( ["cards.registered_at >= ? and cards.registered_at <= ? ",from,to] ).count
  end

end
