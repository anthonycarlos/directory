class RemoveGradeFromTeacher < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :grade, :string
  end
end
