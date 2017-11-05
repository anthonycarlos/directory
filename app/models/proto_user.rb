class ProtoUser < ApplicationRecord
  validates_presence_of :email, :student, :teacher, :grade, :address
end
