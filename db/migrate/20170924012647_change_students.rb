class ChangeStudents < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :student_first, :string
    remove_column :students, :student_last, :string
    remove_column :students, :teacher, :string
    remove_column :students, :mother_first, :string
    remove_column :students, :mother_last, :string
    remove_column :students, :mother_email, :string
    remove_column :students, :mother_phone_number, :string
    remove_column :students, :mother_phone_type, :string
    remove_column :students, :father_first, :string
    remove_column :students, :father_last, :string
    remove_column :students, :father_email, :string
    remove_column :students, :father_phone_number, :string
    remove_column :students, :father_phone_type, :string
    remove_column :students, :grade, :string
    add_column :students, :first, :string
    add_column :students, :last, :string
    add_column :students, :homeroom_id, :integer
    add_column :students, :grade, :integer
  end
end
