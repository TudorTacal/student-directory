@students = []
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def preload_students_file
  filename = ARGV.first
  filename ='students.csv' if filename.nil?
  if File.exists?(filename)
    load_students(filename)
      puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = 'students.csv')
  file = File.open(filename, 'r')
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    get_students(name,cohort)
  end
  file.close
  puts "You loaded #{@students.count} students"
end

def save_students
  file = File.open("students.csv","w")
  @students.each{|student| file.puts [student[:name], student[:cohort]].join(",")}
  file.close
  puts "Your student list was succesfully saved"
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        puts "You were awesome"
        exit
      else
        puts "I don't know what you meant, try again"
    end
end

def get_students(student_name,student_cohort)
  @students << {name: student_name,  cohort: student_cohort.to_sym}
end

def input_names
  @name=STDIN.gets.chomp
end

def input_cohort
  @cohort = STDIN.gets.chomp.to_sym
  @cohort =:november if @cohort.empty?
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  input_names
  puts "Please enter the cohort name"
  input_cohort
  while !@name.empty? do
    get_students(@name,@cohort)
    puts "You successfully added a student"
    puts @students.count==1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    input_names
    break if @name ==""
    input_cohort
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print_students_list
  puts "Type the name of the cohort to see the list of students"
  month = STDIN.gets.chomp.to_sym.downcase
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
preload_students_file
interactive_menu


