# == Schema Information
#
# Table name: people
#
#  id                 :integer(4)      not null, primary key
#  first_name         :string(255)     not null
#  last_name          :string(255)     not null
#  middle_name        :string(255)
#  birthday           :date
#  birthplace         :string(255)
#  mobile             :string(255)
#  phone              :string(255)
#  comment            :text
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer(4)
#  photo_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  gender             :integer(4)      default(0), not null
#

class Person < ActiveRecord::Base
  GENDER = {:male => 0, :female => 1}

  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :relatives, :dependent => :destroy

  has_attached_file :photo,
    :styles => {:thumb => "135x100>", :resized => "600x400>"},
    :url => "/system/:attachment/:id_partition/:style/:id.:extension"

  accepts_nested_attributes_for :addresses

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :gender
  validate :must_be_unique

  scope :sorted, order("last_name, first_name")

  def must_be_unique
    if first_name_changed? || last_name_changed? || middle_name_changed? || birthday_changed? || gender_changed?
      if Person.where(:first_name => first_name).
           where(:last_name => last_name).
           where(:middle_name => middle_name).
           where(:birthday => birthday).
           where(:gender => gender).exists?
        errors.add_to_base("Такой человек уже есть")
      end
    end
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  def self.gender_for_select(options = {:include_blank => false})
    o = [[I18n::t("general.male"), GENDER[:male].to_s], [I18n::t("general.female"), GENDER[:female].to_s]]
    o = [['', nil]] + o if options[:include_blank]
    o
  end

  def gender_text
    I18n::t("general.#{GENDER.index(gender).to_s}")
  end

  def age_int
    a = Time.now.year - birthday.year
  rescue
    ""
  end

  def adult?
    (Time.now.year - birthday.year) > 18
  rescue
    ""
  end

  def age
    a = Time.now.year - birthday.year
    "#{a} #{Russian.p(a, "год", "года", "лет")}"
  rescue
    ""
  end

  def address
    addresses.first if addresses.length>0
  end
end

