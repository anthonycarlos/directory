json.extract! student, :id, :student_first, :student_last, :teacher, :grade, :address, :city, :state, :zip, :mother_first, :mother_last, :mother_email, :mother_phone_number, :mother_phone_type, :father_first, :father_last, :father_email, :father_phone_number, :father_phone_type, :created_at, :updated_at
json.url student_url(student, format: :json)
