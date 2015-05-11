class Project < ActiveRecord::Base
  has_many :used_skills
  has_many :skills, through: :used_skills
  
  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :used_skills, :allow_destroy => true
end
