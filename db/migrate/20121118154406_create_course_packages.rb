class CreateCoursePackages < ActiveRecord::Migration
  def change
    create_table :course_packages do |t|
      t.integer :course_id
      t.integer :number_of_participants
      t.column :course_fee, :bigint
      
      t.timestamps
    end
  end
end
