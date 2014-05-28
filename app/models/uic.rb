class Uic < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  belongs_to :tic

  accepts_nested_attributes_for :addresses

end
