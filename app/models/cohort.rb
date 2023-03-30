# == Schema Information
#
# Table name: cohorts
#
#  id           :integer          not null, primary key
#  cohort_end   :date
#  cohort_start :date
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cohort_id    :integer
#
class Cohort < ApplicationRecord
  has_many(:users, { :class_name => "User", :foreign_key => "cohort_id", :dependent => :destroy })
end
