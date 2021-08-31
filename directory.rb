def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students =[]
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student name to the array
        students << {name: name, cohort: :November}
        puts "Now we have" + " #{students.count}#{students.count > 1 ? " students" : " student"}"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    exit if students.count == 0
    print_header
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    print_footer (students)
end

def print_footer (names)
    if names.count > 1
        x = "students"
    else x = "student"
    end
    puts "Overall, we have #{names.count} great #{x}"
end

students = input_students
#nothing happens until we call the methods

print(students)
