@students =[] # create an empty array

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

def process(selection)
    case selection
    when "1"
        input_students
    when "2"
        show_students
    when "9"
        exit # this will cause the program to terminate
    else
        puts "I don't know what you meant, try again"
    end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list
    print_footer
end

def input_students
    # students =[] # create an empty array
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student name to the array
        @students << {name: name, cohort: :November}
        puts "Now we have" + " #{@students.count}#{@students.count > 1 ? " students" : " student"}"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    @students
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
        x = "students"
    else x = "student"
    end
    puts "Overall, we have #{@students.count} great #{x}"
end

interactive_menu
#students = input_students
