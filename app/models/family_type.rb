# == Schema Information
#
# Table name: family_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FamilyType < ActiveRecord::Base
  has_many :family_family_types
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

#  has_many :family_family_types, :dependent => :destroy
#  has_many :families, :through => :family_family_type
#  has_many :families

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def families_count
#   Family.where(:family_type_id => id).count
    FamilyType.joins(:family_family_types => :family).where(:family_types => {:id => id }).count
  end

  def families_count_period(from,to)
    FamilyType.joins(:family_family_types => :family).where(:family_types => {:id => id }).where( ["families.created_at >= ? and families.created_at <= ? ",from,to] ).count
  end
end
