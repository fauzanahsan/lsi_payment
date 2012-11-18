class BillingInformation < ActiveRecord::Base
  attr_accessible :order_id, :first_name, :last_name, :address1, :address2, :city, :country_code, :phone, :email
  
  belongs_to :order
end
