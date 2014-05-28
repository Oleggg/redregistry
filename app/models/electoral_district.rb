class ElectoralDistrict < ActiveRecord::Base
  ELECTIONS_LEVEL = {:national => 1, :regional => 2, :local => 3}

  has_many :streets
  has_many :houses

  accepts_nested_attributes_for :streets
  accepts_nested_attributes_for :houses

  scope :sorted, order("number")

  def self.elections_level_for_select
    [:national, :regional, :local].collect {|s| [I18n.t("electoral_districts.elections_level.#{s}"), ELECTIONS_LEVEL[s]] }
  end

  def elections_level_for_display
    I18n.t("electoral_districts.elections_level.#{ELECTIONS_LEVEL.index(self.elections_level)}")
  end

end
