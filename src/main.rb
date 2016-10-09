require 'learning_path_generator'
require 'student'
require 'csv_file_tokenizer'

domains = LearningPathGenerator.new
students = Student.load_students
length = ARGV[0].nil? ? LearningPathGenerator::DEFAULT_LEARNING_PATH_LENGTH : ARGV[0].to_i
students.each { |student| puts "#{student.name},#{domains.generate_learning_path(student, length).join(',')}" }
