#!/usr/bin/env ruby

records = []
count = 1
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
#puts named_records
puts "Records: #{named_records.count}"
