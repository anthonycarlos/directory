class Student < ApplicationRecord
  scoped_search on: [:student_first, :student_last]
  scoped_search on: :teacher, profile: :teachers
  scoped_search on: :grade, profile: :grades

  before_save :strip_formatting

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
