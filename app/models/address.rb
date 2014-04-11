# == Schema Information
#
# Table name: addresses
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  post_code        :string(255)
#  address_line     :string(255)
#  addressable_id   :integer(4)      not null
#  addressable_type :string(20)      not null
#  created_at       :datetime
#  updated_at       :datetime
#  lat              :float           default(0.0)
#  lng              :float           default(0.0)
#  region_id        :integer(4)
#  district_id      :integer(4)
#  city_id          :integer(4)
#  town_id          :integer(4)
#  street_id        :integer(4)
#

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true

  belongs_to :region
  belongs_to :district
  belongs_to :city
  belongs_to :town
  belongs_to :street

  def full_address
    a = []
    a << post_code if post_code && !post_code.empty?
    a << region.name if region
    a << district.name if district
    a << city.name if city
    a << address_line if address_line && !address_line.empty?
    a.join(", ")
  end
end

