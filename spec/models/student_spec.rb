require 'rspec/given'
require 'student'

describe "Student phone numbers" do

  context "when saved with a valid 10-digit number without formatting" do
    Given(:student) { Student.new(mother_phone_number: '6145551212', father_phone_number: '6145551234') }
    When(:result) { student.save }
    Then { expect(result).to be true }
    And { expect(student.formatted_mother_phone_number).to be == '(614)555-1212' }
  end

  context "when saved with a valid 10-digit number with formatting" do
    Given(:student) { Student.new(mother_phone_number: '614-555-1212', father_phone_number: '6145551234') }
    When(:result) { student.save }
    Then { expect(result).to be true }
    And { expect(student.mother_phone_number).to be == '6145551212' }
    And { expect(student.formatted_mother_phone_number).to be == '(614)555-1212' }
  end

end

describe "Student father phone numbers" do

  context "when saved with a valid 10-digit number without formatting" do
    Given(:student) { Student.new(mother_phone_number: '6145551212', father_phone_number: '6145551234') }
    When(:result) { student.save }
    Then { expect(result).to be true }
    And { expect(student.formatted_father_phone_number).to be == '(614)555-1234' }
  end

  context "when saved with a valid 10-digit number with formatting" do
    Given(:student) { Student.new(mother_phone_number: '6145551212', father_phone_number: '614-555-1234') }
    When(:result) { student.save }
    Then { expect(result).to be true }
    And { expect(student.father_phone_number).to be == '6145551234' }
    And { expect(student.formatted_father_phone_number).to be == '(614)555-1234' }
  end

end
