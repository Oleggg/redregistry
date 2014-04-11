# == Schema Information
#
# Table name: family_structures
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FamilyStructure < ActiveRecord::Base
  has_many :families
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def families_count
    Family.where(:family_structure_id => id).count
  end

  def families_count_period(from,to)
#    Family.where(:family_structure_id => id).count
    FamilyStructure.joins(:families).where(:families => {:family_structure_id => id }).where( ["families.created_at >= ? and families.created_at <= ? ",from,to] ).count
  end
end
