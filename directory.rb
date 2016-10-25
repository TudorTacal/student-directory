def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students=[]
  name = gets.chomp
  cohort = gets.chomp.to_sym
  cohort = :november if cohort ==""
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name,  cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    break if name ==""
    cohort = gets.chomp.to_sym
    cohort = :november if cohort ==""
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  ary = students.map{|x| x[:cohort]}.uniq.each do |y|
    students.each do |x|
      puts "#{x[:name]}".ljust(30) + "(#{x[:cohort]} cohort)" if x[:cohort]==y
    end
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

