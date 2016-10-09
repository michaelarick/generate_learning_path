require 'csv_file_tokenizer'

describe CSVFileTokenizer do 
  before do
    @lines = 
      [ "Student Name,RF,RL,RI,L\n",
        "Albin Stanton,2,3,K,3\n", 
        "Erik Purdy,3,1,1,1\n",
      ]
  end

  context 'when the file has headers' do
    before do
      @tokenizer= CSVFileTokenizer.new('fake_file_with_headers', true)
      allow(@tokenizer).to receive(:read_lines) { @lines }
    end

    it "returns a hash with h1 => v2, etc." do
      expect(@tokenizer.tokens).to eq([{
        'Student Name' => 'Albin Stanton',
        'RF' => '2',
        'RL' => '3',
        'RI' => 'K',
        'L' => '3'
      },
      {
        'Student Name' => 'Erik Purdy',
        'RF' => '3',
        'RL' => '1',
        'RI' => '1',
        'L' => '1'
      }])
    end
  end

  context 'when the file has no headers' do
    before do
      @tokenizer= CSVFileTokenizer.new('fake_file_with_headers')
      allow(@tokenizer).to receive(:read_lines) { @lines }
    end

    it "returns an array of arrays of strings" do
      expect(@tokenizer.tokens).to eq(
        [
          ['Student Name', 'RF', 'RL', 'RI', 'L'],
          ['Albin Stanton', '2', '3', 'K', '3'],
          ['Erik Purdy', '3', '1', '1', '1']
        ])
    end
  end
end