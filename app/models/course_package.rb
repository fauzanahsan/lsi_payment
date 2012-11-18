class CoursePackage < ActiveRecord::Base
  attr_accessible :course_id, :number_of_participants, :course_fee
  
  belongs_to :course
  has_one :order
end
