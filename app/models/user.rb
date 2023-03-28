# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  fun_fact        :string
#  image           :string
#  last_name       :string
#  password_digest :string
#  quote           :string
#  resume_link     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  cohort_id       :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:skills, { :class_name => "Skill", :foreign_key => "user_id", :dependent => :destroy })
  belongs_to(:cohort, { :required => true, :class_name => "Cohort", :foreign_key => "cohort_id" })
end
