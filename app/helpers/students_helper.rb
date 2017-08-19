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

  def display_mother(student)
    output = ''
    if student.mother_first.present? || student.mother_last.present?
      output << "#{student.mother_first} #{student.mother_last}<br />"
      output << "#{student.mother_email}<br />" if student.mother_email
      output << "#{student.mother_phone_type}: #{student.formatted_mother_phone_number}" unless student.mother_phone_number.blank?
    end
    output.html_safe
  end

  def display_father(student)
    output = ''
    if student.father_first.present? && student.father_last.present?
      output << "#{student.father_first} #{student.father_last}<br />"
      output << "#{student.father_email}<br />" if student.father_email
      output << "#{student.father_phone_type}: #{student.formatted_father_phone_number}" unless student.father_phone_number.blank?
    end
    output.html_safe
  end

end
