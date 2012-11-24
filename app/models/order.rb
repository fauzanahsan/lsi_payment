class Order < ActiveRecord::Base
  attr_accessible :order_id, :session_id, :course_package_id, :accomodation_fee_info, :accomodation_fee, :course_fee,
                  :other_fee_info, :other_fee
  
  belongs_to :course_package
  
  after_create :set_total_amount
  
  def set_total_amount
    self.total_amount = self.course_fee + self.accomodation_fee + self.other_fee
    save
  end
  
end
