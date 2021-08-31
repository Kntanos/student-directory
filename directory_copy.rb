def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students =[]
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the name to a new hash
        student = {name: name}
        # give the student hash to input_cohort 
        input_cohort(student)
        # add the hash to the students array
        students << student  
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def input_cohort(student)
    puts "Cohort?"
    cohort = gets.chomp
    # append the cohort to the hash
    if cohort.empty?
        student[:cohort] = "unknown"
    else
        student[:cohort] = cohort
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    puts "Edit any entries?"
    answer = gets.chomp.downcase
    if answer == "yes"
        edit(students)
    end
end

def edit(students)
    puts "Which entry?"
    entry = gets.chomp
    puts "Which field?"
    field = gets.chomp
    puts "Change to?"
    change = gets.chomp
    students[(entry.to_i - 1)][field.to_sym] = change
    print(students)
end

=begin
def print(students)
    x = 0
    while x < students.length do
        puts "#{x + 1}. #{students[x][:name]} (#{students[x][:cohort]} cohort)"
        x += 1
    end
end
=end
def print_footer (names)
    puts puts "Overall, we have #{names.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer (students)