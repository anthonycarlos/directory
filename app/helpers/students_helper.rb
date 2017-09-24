module StudentsHelper

  def display_address(student)
    output = ''
    address_fields = [student.address, student.city, student.state, student.zip]
    if address_fields.all? { |address_field| address_field.present? }
      output << "#{student.address}<br />"
      output << "#{student.city}, #{student.state} #{student.zip}"
    end
    output.html_safe
  end

  def display_parent_guardian(student, order)
    output = ''
    if pg = student.parent_guardians.find_by_order(order)
      output << "#{pg.first} #{pg.last}<br />"
      output << "#{pg.email}<br />" unless pg.email.blank?
      output << "#{pg.phone}" unless pg.phone.blank?
    end
    output.html_safe
  end

  def display_grade(student)
    output = (student.grade == 0 ? 'K' : student.grade.to_s)
    output.html_safe
  end

end
