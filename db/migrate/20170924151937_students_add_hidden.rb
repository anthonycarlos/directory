class StudentsAddHidden < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :hidden, :boolean, default: true, null: false
  end
end
