class Member < ActiveRecord::Base
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :subscribers

  accepts_nested_attributes_for :addresses

  belongs_to :region_committee

  has_attached_file :photo,
    :styles => {:thumb => "135x100>", :resized => "600x400>"},
    :url => "/system/:attachment/:id_partition/:style/:id.:extension"

  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validate :must_be_unique

  scope :sorted, order("last_name, first_name")

  def must_be_unique
    if first_name_changed? || last_name_changed? || middle_name_changed?
      if Member.where(:first_name => first_name).
           where(:last_name => last_name).
           where(:middle_name => middle_name).exists?
        errors.add_to_base("Такой человек уже есть")
      end
    end
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

end
