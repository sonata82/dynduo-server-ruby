class UsedSkill < ActiveRecord::Base
  belongs_to :project
  belongs_to :skill
  
  accepts_nested_attributes_for :skill
end
