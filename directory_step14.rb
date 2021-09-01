@students =[] 

def print_menu
    puts [
    "1. Input the students",
    "2. Show the students",
    "3. Save the list to file",
    "4. Load list from file",
    "9. Exit"
]
end

def feedback
    puts "Completed succesfully"
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
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
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    @name = STDIN.gets.chomp

    while !@name.empty? do
        add_to_list()
        puts "Now we have" + " #{@students.count}#{@students.count > 1 ? " students" : " student"}"
        @name = STDIN.gets.chomp
    end
    @students
end

def add_to_list(cohort = "November")
    @students << {name: @name, cohort: cohort.to_sym}
end

def show_students
    print_header
    print_student_list
    print_footer
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_student_list
    exit if @students.count == 0
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    if @students.count > 1
        noun = "students"
    else noun = "student"
    end
    puts "Overall, we have #{@students.count} great #{noun}"
end

def save_students
    puts "Enter file name"
    filename = gets.chomp
    file = File.open(filename, "a") do |file|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            csv_line = student_data.join(",")
            file.puts csv_line
        end
    end
    feedback
end

def load_file_check
 if @filename == @filename_check
        puts "You have already loaded this list"
        interactive_menu
    else
     return
    end
end

def load_students
    puts "Enter file name"
    @filename = gets.chomp
    load_file_check
        file = File.open(@filename, "r") do |file|
            file.readlines.each do |line|
            @name, cohort = line.chomp.split(",")
                add_to_list(cohort)
            end
        end
    
    @filename_check = @filename
    feedback
end
=begin
def try_load_students
    filename = ARGV.first 
    return if filename.nil? 
    if File.exists?(filename)
        load_students(filename)
          puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exists."
        exit 
    end
end
=end
#try_load_students
interactive_menu



