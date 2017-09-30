class Teacher < ApplicationRecord
  has_many :homerooms

  validates_presence_of :last

end
