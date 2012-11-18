class CreateBillingInformations < ActiveRecord::Migration
  def change
    create_table :billing_informations do |t|
      t.integer :order_id
      t.string  :first_name
      t.string :last_name
      t.text :address1
      t.text :address2
      t.string :city
      t.string :country_code
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
