class Project < ActiveRecord::Base
  has_many :usedSkills
  has_many :skills, through: :usedSkills
end
