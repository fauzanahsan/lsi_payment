class Order < ActiveRecord::Base
  attr_accessible :order_id, :session_id, :course_package_id, :accomodation_fee_info, :accomodation_fee,
                  :other_fee_info, :other_fee
  
  belongs_to :course_package
end
