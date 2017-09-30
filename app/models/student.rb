class Student < ApplicationRecord
  has_many :parent_guardians
  belongs_to :homeroom

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :grade
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  scoped_search on: [:first, :last]
  scoped_search relation: :homeroom, on: :name, profile: :homerooms
  scoped_search on: :grade, profile: :grades

end
