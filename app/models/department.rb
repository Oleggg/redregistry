# == Schema Information
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  full_name  :string(500)
#  phone1     :string(255)
#  phone2     :string(255)
#  comment    :string(2000)
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

end
