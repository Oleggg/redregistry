class CityDistrict < ActiveRecord::Base
  belongs_to :city

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :sorted, order("name")

  def self.for_select(city_id)
    Street.where(:city_id => city_id ).all
  end

end
