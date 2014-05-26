class Tic < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :members

  scope :sorted, order("name")

end
