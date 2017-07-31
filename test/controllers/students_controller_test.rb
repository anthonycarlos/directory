require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { address: @student.address, city: @student.city, father_email: @student.father_email, father_first: @student.father_first, father_last: @student.father_last, father_phone_number: @student.father_phone_number, father_phone_type: @student.father_phone_type, grade: @student.grade, mother_email: @student.mother_email, mother_first: @student.mother_first, mother_last: @student.mother_last, mother_phone_number: @student.mother_phone_number, mother_phone_type: @student.mother_phone_type, state: @student.state, student_first: @student.student_first, student_last: @student.student_last, teacher: @student.teacher, zip: @student.zip } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { address: @student.address, city: @student.city, father_email: @student.father_email, father_first: @student.father_first, father_last: @student.father_last, father_phone_number: @student.father_phone_number, father_phone_type: @student.father_phone_type, grade: @student.grade, mother_email: @student.mother_email, mother_first: @student.mother_first, mother_last: @student.mother_last, mother_phone_number: @student.mother_phone_number, mother_phone_type: @student.mother_phone_type, state: @student.state, student_first: @student.student_first, student_last: @student.student_last, teacher: @student.teacher, zip: @student.zip } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
