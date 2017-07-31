class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :student_first
      t.string :student_last
      t.string :teacher
      t.integer :grade
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :mother_first
      t.string :mother_last
      t.string :mother_email
      t.string :mother_phone_number
      t.string :mother_phone_type
      t.string :father_first
      t.string :father_last
      t.string :father_email
      t.string :father_phone_number
      t.string :father_phone_type

      t.timestamps
    end
  end
end
