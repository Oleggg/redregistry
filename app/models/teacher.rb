# == Schema Information
#
# Table name: teachers
#
#  id         :integer(4)      not null, primary key
#  person_id  :integer(4)      not null
#  teen_id    :integer(4)      not null
#  school_id  :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Teacher < ActiveRecord::Base
end
