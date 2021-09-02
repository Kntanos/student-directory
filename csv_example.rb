require "csv"
@students = []

def load_students
  CSV.foreach("students.csv", headers: true, header_converters: :symbol) do |row|
    headers ||= row.headers  
    @students << row.to_h
  end
end

def print_student_list
  @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def save_students
  CSV.open("students.csv", "a") do |csv|
    #csv << headers
      @students.each do |student|
        csv << student.values
      end
    end
end

load_students
save_students
