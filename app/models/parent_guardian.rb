class ParentGuardian < ApplicationRecord
  belongs_to :student

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :position

  before_save :strip_formatting

  def strip_formatting
    self.phone = self[:phone].gsub(/[^0-9]/, '')
  end

  def phone
    unless (p = self[:phone]).blank?
    "#{p.slice(0,3)}-#{p.slice(3,3)}-#{p.slice(6,4)}"
    else
      ''
    end
  end


end
