# == Schema Information
#
# Table name: doctors
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Doctor < ActiveRecord::Base
  has_many :card_doctors
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def total_children_count
    Doctor.joins(:card_doctors => :card).where(:doctors => { :id => id } ).count
  end

  def total_families_count
    Family.joins(:cards => :card_doctors).where(:card_doctors => { :doctor_id => id }).count
  end

end
