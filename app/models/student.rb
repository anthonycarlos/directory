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
  scoped_search on: :teacher, profile: :teachers
  scoped_search on: :grade, profile: :grades

  #before_save :strip_formatting

  def strip_formatting
    self.mother_phone_number = self.mother_phone_number.gsub(/[^0-9]/, '')
    self.father_phone_number = self.father_phone_number.gsub(/[^0-9]/, '')
  end

  def formatted_mother_phone_number
    n = self.mother_phone_number
    "(#{n.slice(0,3)})#{n.slice(3,3)}-#{n.slice(6,4)}"
  end

  def formatted_father_phone_number
    n = self.father_phone_number
    "(#{n.slice(0,3)})#{n.slice(3,3)}-#{n.slice(6,4)}"
  end

end
