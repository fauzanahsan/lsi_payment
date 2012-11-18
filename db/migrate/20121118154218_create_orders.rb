class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :session_id
      t.integer :course_package_id
      t.column :total_amount, :bigint, :default => 0
      t.string :accomodation_fee_info
      t.column :accomodation_fee, :bigint
      t.string :other_fee_info
      t.column :other_fee, :bigint
      t.boolean :paid_status, :default => false
      
      t.timestamps
    end
  end
end
