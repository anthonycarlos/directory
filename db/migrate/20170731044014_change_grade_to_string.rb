class ChangeGradeToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :grade, :intger
    add_column :students, :grade, :string
    remove_column :teachers, :grade, :intger
    add_column :teachers, :grade, :string
  end
end
