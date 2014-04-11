# == Schema Information
#
# Table name: relationships
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  gender     :integer(4)      default(0)
#

class Relationship < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :gender

  scope :sorted, order("name")

  def self.for_select(options = {:include_blank => false})
    o = sorted.all.collect{|i| [i.name, i.id]}
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def gender_text
    I18n::t("general.#{Person::GENDER.index(gender).to_s}")
  end
end

