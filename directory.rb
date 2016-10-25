def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students=[]
  puts "Insert student name:"
  name = gets.chomp
  puts "Insert student hobby:"
  hobby = gets.chomp
  puts "Insert student country of birth:"
  country = gets.chomp
  puts "Insert student height:"
  height = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    
    #add the student hash to the array
    students << {name: name, hobby: hobby, country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Insert student name:"
    name = gets.chomp
    break if name.empty?
    puts "Insert student hobby:"
    hobby = gets.chomp
    puts "Insert student country of birth:"
    country = gets.chomp
    puts "Insert student height:"
    height = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  count = 0
  until count == students.size
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort hobby:#{students[count][:hobby]}, country of birth:#{students[count][:country]}, height:#{students[count][:height]})"
    count +=1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"  
end
#nothing happens until we call this methods
students = input_students
print_header
print(students)
print_footer(students)

