class CSVFileTokenizer
  def initialize(file_name, has_headers = false)
    @file_name = file_name
    @has_headers = has_headers
  end

  def read_lines
    lines = File.readlines(@file_name)
  end

  def tokens
    @tokens = []
    read_lines.each.with_index do |line, index|
      if index == 0 && @has_headers
        @headers = line.chop.split(',')
      else 
        vals = line.chop.split(',')
        if @has_headers
          @tokens.push(Hash[@headers.zip(vals)])
        else
          @tokens.push(vals)
        end
      end
    end
    @tokens
  end
end