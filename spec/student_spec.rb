require 'student'

describe Student do 
  before do
    student_hash = {
      'Student Name' => 'Test Testerson',
      'SUBJ1' => '2',
      'SUBJ2' => '3',
      'SUBJ3' => 'K',
      'SUBJ4' => 'Q'
    }

    @student = Student.new(student_hash)
  end

  describe "Student" do
    it "returns its name" do
      expect(@student.name).to eq('Test Testerson')
    end

    it "returns its level in a subject" do
      expect(@student.level('SUBJ3')).to eq('K')
    end

    it "returns nil for an unknown subject" do
      expect(@student.level('FAKE')).to be_nil
    end
  end
end