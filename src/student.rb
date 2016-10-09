class Student

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


