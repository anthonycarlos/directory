class CreateParentGuardian < ActiveRecord::Migration[5.1]
  def change
    create_table :parent_guardians do |t|
      t.string :first
      t.string :last
      t.string :description
      t.string :phone
      t.string :email
      t.integer :student_id

      t.timestamps
    end
  end
end
