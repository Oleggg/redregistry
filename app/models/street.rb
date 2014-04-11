# == Schema Information
#
# Table name: streets
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)     not null
#  region_id   :integer(4)      not null
#  district_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#  code        :integer(8)
#  city_id     :integer(8)
#  town_id     :integer(8)
#

class Street < ActiveRecord::Base
  belongs_to :region, :primary_key => "code"
  belongs_to :district, :primary_key => "code"
  belongs_to :city, :primary_key => "code"
  belongs_to :town, :primary_key => "code"

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :sorted, order("name")

  def self.for_select(town_id)
    Street.where(:town_id => district_id ).all
  end

  def self.for_select(city_id)
    Street.where(:city_id => city_id ).all
  end

  def self.for_select_town(town_id)
    Street.where(:town_id => town_id ).all
  end

end
