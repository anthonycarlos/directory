class CreateHomeroom < ActiveRecord::Migration[5.1]
  def change
    create_table :homerooms do |t|
      t.string :name
      t.integer :teacher_id

      t.timestamps
    end
  end
end
