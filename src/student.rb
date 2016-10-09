require 'csv_file_tokenizer'

class Student
  def self.load_students(file_path = 'data/student_tests.csv')
    student_hash_generator = CSVFileTokenizer.new(file_path, true)
    student_hash_generator.tokens.map { |student_hash| Student.new(student_hash) }
  end

  def initialize(student_hash)
    @name = student_hash.delete('Student Name')
    @levels = student_hash
  end

  def name
    return @name
  end

  def level(subject)
    return @levels[subject]
  end

  def to_s
    return "#{name}"":\n" + 
      @subjects.map{ |subject| ("#{subject} => #{level(subject)}")}.join("\n")
  end
end


