class CreateProtoUser < ActiveRecord::Migration[5.1]
  def change
    create_table :proto_users do |t|
      t.string :email
      t.string :student
      t.string :teacher
      t.string :grade
      t.string :address

      t.timestamps
    end
  end
end
