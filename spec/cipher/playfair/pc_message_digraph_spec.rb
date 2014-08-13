describe PcMessageDigraph do

  describe '#first_char' do
    return_val = described_class.new('A','B').first_char
    it 'returns a string' do
      expect(return_val).to be_an_instance_of(String)
    end
    it 'returns equal to what it was initialized with' do
      expect(return_val).to eql('A')
    end
  end

  describe '#last_char' do
    it 'returns a string' do
      expect(described_class.new('A','A').last_char).to be_an_instance_of(String)
    end
    it 'always returns equal to what it was initialized with' do
      expect(described_class.new('A','A').last_char).to eql('A')
    end
  end
  
  describe '#remove_duplicates' do
    it 'replaces last_char with an "X" if it matches first_char' do
      obj = described_class.new('A','A')
      expect(obj.last_char).to eql('A')
      obj.remove_duplicates
      expect(obj.last_char).to eql('X')
    end
    it 'has no effect if first_char does not match last_char' do
      obj = described_class.new('A','B')
      expect(obj.last_char).to eql('B')
      obj.remove_duplicates
      expect(obj.last_char).to eql('B')
    end
  end

end