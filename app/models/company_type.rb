# == Schema Information
#
# Table name: company_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class CompanyType < ActiveRecord::Base
  has_many :companies

  validates_presence_of :name
  validates_uniqueness_of :name
  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end
end

