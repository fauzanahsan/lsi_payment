class Course < ActiveRecord::Base
  attr_accessible :course_name
  
  has_many :course_packages
end
