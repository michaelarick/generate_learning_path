require 'csv_file_tokenizer'
require 'student'

class LearningPathGenerator
  DEFAULT_LEARNING_PATH_LENGTH = 5

  def initialize(file_path = 'data/domain_order.csv', learning_path_length = DEFAULT_LEARNING_PATH_LENGTH)
    @learning_path_length = learning_path_length
    load_domain_order(file_path)
  end

  def generate_learning_path(student, path_length = @learning_path_length)
    list = []
    @level_names.each do |level|
      level_subjects = @domains_by_level[level]
      level_subjects.each do |subject|
        list << "#{level}.#{subject}" if level_num(student.level(subject)) <= level_num(level)
        return list if list.length >= path_length
      end
    end
    return list
  end

  private

  def load_domain_order(file_path)    
    domain_list_generator = CSVFileTokenizer.new(file_path, false)
    @domains_by_level = {}
    @level_names = []
    domain_list_generator.tokens.each do |level_and_domains| 
      level = level_and_domains.first
      @domains_by_level[level] = level_and_domains.drop(1)
      @level_names.push(level)
    end
  end

  def level_num(level)
    return @level_names.find_index(level) || 0
  end
end
