class ParentGuardian < ApplicationRecord
  belongs_to :student

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :order

end
