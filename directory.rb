def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students=[]
  name = gets.chomp
  cohort = gets.chomp.to_sym
  cohort =:november if cohort.empty?
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name,  cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    break if name ==""
    cohort = gets.chomp.to_sym
    cohort =:november if cohort.empty?
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  puts "Type the name of the cohort to see the list of students"
  month = gets.chomp.to_sym.downcase
  month = :november if  month.empty?
  students.each{|student| puts "#{student[:name]}".ljust(30) + "(#{student[:cohort]} cohort)" if student[:cohort]==month}
  return puts "No students were found in this cohort"  
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"  
end
#nothing happens until we call this methods
students = input_students
print_header
print(students)
print_footer(students)

