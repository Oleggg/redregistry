# == Schema Information
#
# Table name: registration_causes
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RegistrationCause < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  #--------------------------------------------------------#
  has_many :card_registration_causes, :dependent => :destroy

  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def children_count
    CardRegistrationCause.where(:registration_cause_id => id).count
  end

  def families_count
    CardRegistrationCause.where(:registration_cause_id => id).joins(:card).count("distinct family_id")
  end
end

