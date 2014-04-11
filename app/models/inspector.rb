# == Schema Information
#
# Table name: inspectors
#
#  id         :integer(4)      not null, primary key
#  person_id  :integer(4)      not null
#  teen_id    :integer(4)      not null
#  date_from  :date
#  date_to    :date
#  created_at :datetime
#  updated_at :datetime
#

class Inspector < ActiveRecord::Base
end
