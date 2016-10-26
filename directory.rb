def interactive_menu
  students= []
  
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" #9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        #input the students
        input_students
      when "2"
        #show the students
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end
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
    students.each{|student| puts "#{student[:name]}".ljust(30) + "(#{student[:cohort]} cohort)"  if month==student[:cohort]} if students.count > 0  
  else
    puts "No students were found in this cohort" 
  end
end

def print_footer(names)
  puts names.count==1 ? "Overall, we have #{names.count} great student" : "Overall, we have #{names.count} great students"
end
#nothing happens until we call this methods
interactive_menu


