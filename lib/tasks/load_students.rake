namespace :directory do
  desc "Loads students from an excel file exported as tab-delimited. Dupes removed from homeroom column."
  task :load_students => :environment do
    records = []
    count = 1
    # File is expected to exist at RAILS_ROOT.
    File.open('201718-directory.txt', 'r') do |f|
      f.each_line("\r") do |line|
        parsed_line = line.split("\t")
        unless count == 1
          records << parsed_line.map {|col| col.gsub("\"", "").strip }
        end
        count += 1
      end
    end

    puts "Consistent record length data integrity check..."
    unless records.all?{|record| record.size == 16}
      puts "Failed. Stopping."
      return
    else
      puts "Passed. Continuing."
    end

    # Create a hash of all the data. Not too large. Expect ~450 students.
    named_records = records.map do |record|
      hsh = {}
      hsh['student_last_name']  = record[0]
      hsh['student_first_name'] = record[1]
      hsh['home_room']          = record[2]
      hsh['grade']              = record[3]
      hsh['address']            = record[4]
      hsh['city']               = record[5]
      hsh['state']              = record[6]
      hsh['zip']                = record[7]
      hsh['pg1_first_name']     = record[8]
      hsh['pg1_last_name']      = record[9]
      hsh['pg1_phone']          = record[10]
      hsh['pg1_email']          = record[11]
      hsh['pg2_first_name']     = record[12]
      hsh['pg2_last_name']      = record[13]
      hsh['pg2_phone']          = record[14]
      hsh['pg2_email']          = record[15]
      hsh
    end

    puts "Records: #{named_records.count}"

    # Now let's create objects.
    named_records.each_with_index do |record, i|
      # Does the teacher exist? If not, create it.
      # Does the homeroom exist? If not, create it.
      # Create the student.
      # Create the student's parents.
      teacher = Teacher.find_or_create_by(last: record['home_room'].split(',').first)
      homeroom = Homeroom.find_or_create_by(name: record['home_room'])
      homeroom.teacher = teacher
      homeroom.save
      student = Student.new(first: record['student_first_name'],
                            last: record['student_last_name'],
                            homeroom: homeroom,
                            grade: record['grade'],
                            address: record['address'],
                            city: record['city'],
                            state: record['state'],
                            zip: record['zip']
                           )
      parent_guardian_1 = ParentGuardian.find_or_create_by(first: record['pg1_first_name'],
                                                           last: record['pg1_last_name'],
                                                           phone: record['pg1_phone'],
                                                           email: record['pg1_email'],
                                                           student: student,
                                                           position: 1
                                                          )
      user_1 = User.find_by(email: record['pg1_email'])
      unless user_1
         user_1 = User.create(email: record['pg1_email'],
                              password: 'abc123'
                             )
      end
      parent_guardian_2 = ParentGuardian.find_or_create_by(first: record['pg2_first_name'],
                                                           last: record['pg2_last_name'],
                                                           phone: record['pg2_phone'],
                                                           email: record['pg2_email'],
                                                           student: student,
                                                           position: 2
                                                          )
      user_2 = User.find_by(email: record['pg2_email'])
      unless user_2
         user_2 = User.create(email: record['pg2_email'],
                              password: 'abc123'
                             )
      end
    end

  end

end
