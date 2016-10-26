@students = []
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
    # 3. do what the user has asked
    case selection
      when "1"
        #input the students
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.delete("\n")
  cohort = gets.delete("\n").to_sym
  cohort =:november if cohort.empty?
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name,  cohort: cohort}
    puts @students.count==1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    name = gets.delete("\n")
    break if name ==""
    cohort = gets.delete("\n").to_sym
    cohort =:november if cohort.empty?
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list
  puts "Type the name of the cohort to see the list of students"
  month = gets.chomp.to_sym.downcase
  month = :november if  month.empty?
  ary = @students.map{|x| x[:cohort]}
  if ary.include?(month)
    @students.each{|student| puts "#{student[:name]}".ljust(30) + "(#{student[:cohort]} cohort)"  if month==student[:cohort]} if @students.count > 0  
  else
    puts "No students were found in this cohort" 
  end
end

def print_footer
  puts @students.count==1 ? "Overall, we have #{@students.count} great student" : "Overall, we have #{@students.count} great students"
end
#nothing happens until we call this methods
interactive_menu


