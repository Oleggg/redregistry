# == Schema Information
#
# Table name: family_family_types
#
#  id             :integer(4)      not null, primary key
#  family_id      :integer(4)      not null
#  family_type_id :integer(4)      not null
#  created_at     :datetime
#  updated_at     :datetime
#

class FamilyFamilyType < ActiveRecord::Base
  belongs_to :family
  belongs_to :family_type

  validates_presence_of :family
  validates_presence_of :family_type
end
