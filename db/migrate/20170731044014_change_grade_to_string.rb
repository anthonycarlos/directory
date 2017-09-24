class ChangeGradeToString < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :grade, :integer
    add_column :students, :grade, :string
    remove_column :teachers, :grade, :integer
    add_column :teachers, :grade, :string
  end
end
