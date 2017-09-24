class ParentGuardiansAddOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :parent_guardians, :position, :integer
  end
end
