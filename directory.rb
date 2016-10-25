def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students=[]
  name = gets.delete("\n")
  cohort = gets.delete("\n").to_sym
  cohort =:november if cohort.empty?
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name,  cohort: cohort}
    puts students.count <2 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    name = gets.delete("\n")
    break if name ==""
    cohort = gets.delete("\n").to_sym
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
  ary = students.map{|x| x[:cohort]}
  if ary.include?(month)
    students.each{|student| puts "#{student[:name]}".ljust(30) + "(#{student[:cohort]} cohort)"  if month==student[:cohort]}  
  else
    puts "No students were found in this cohort" 
  end
end

def print_footer(names)
  puts names.count<2 ? "Overall, we have #{names.count} great student" : "Overall, we have #{names.count} great students"
end
#nothing happens until we call this methods
students = input_students
print_header
print(students)
print_footer(students)

