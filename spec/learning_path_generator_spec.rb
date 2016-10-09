require 'learning_path_generator'

describe 'LearningPathGenerator' do
  before do
    allow_any_instance_of(CSVFileTokenizer).to receive(:tokens).and_return([
        #Alternate subject order per level
        %w(K SUBJ4 SUBJ3 SUBJ2 SUBJ1),
        %w(1 SUBJ1 SUBJ2 SUBJ3 SUBJ4),
        %w(2 SUBJ4 SUBJ3 SUBJ2 SUBJ1),
        %w(3 SUBJ1 SUBJ2 SUBJ3 SUBJ4),
        %w(Q SUBJ4 SUBJ3 SUBJ2 SUBJ1),
      ])

    @learning_path_generator = LearningPathGenerator.new
  end

  context 'when the student is entirely at the highest level' do
    it "generates the correct learning path for the student" do
      student_hash = {
        'Student Name' => 'Test Testerson',
        'SUBJ1' => 'Q',
        'SUBJ2' => 'Q',
        'SUBJ3' => 'Q',
        'SUBJ4' => 'Q',
      }
      student = Student.new(student_hash)

      expect(@learning_path_generator.generate_learning_path(student)).to eq(%w(Q.SUBJ4 Q.SUBJ3 Q.SUBJ2 Q.SUBJ1))
    end
  end

  context 'when the student has some higher grade levels already' do
    it "generates the correct learning path for the student" do
      student_hash = {
        'Student Name' => 'Test Testerson',
        'SUBJ1' => '2',
        'SUBJ2' => '3',
        'SUBJ3' => 'K',
        'SUBJ4' => 'Q',
      }
      student = Student.new(student_hash)

      expect(@learning_path_generator.generate_learning_path(student)).to eq(%w(K.SUBJ3 1.SUBJ3 2.SUBJ3 2.SUBJ1 3.SUBJ1))
    end
  end

  context 'when the student has no levels yet' do
    before do
      @student = Student.new({
        'Student Name' => 'Test Testerson',
      })
    end

    it 'generates a learning path that treats the student as starting at the lowest level' do
      expect(@learning_path_generator.generate_learning_path(@student)).to eq(%w(K.SUBJ4 K.SUBJ3 K.SUBJ2 K.SUBJ1 1.SUBJ1))
    end

    context 'when a longer learning path length is passed in' do
      it "generates a longer learning path for the student" do
        expect(@learning_path_generator.generate_learning_path(@student, 10)).to eq(
          %w(K.SUBJ4 K.SUBJ3 K.SUBJ2 K.SUBJ1 1.SUBJ1 1.SUBJ2 1.SUBJ3 1.SUBJ4 2.SUBJ4 2.SUBJ3)
        )
      end
    end
  end

end