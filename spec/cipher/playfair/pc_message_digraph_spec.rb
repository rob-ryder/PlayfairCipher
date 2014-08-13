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
      expect(described_class.new('A','B').last_char).to be_an_instance_of(String)
    end
    it 'returns equal to what it was initialized with when last char and first char were not the same' do
      expect(described_class.new('A','B').last_char).to eql('B')
    end
    it 'returns "X" when initialized with matching first and last chars' do
      expect(described_class.new('A','A').last_char).to eql('X')
    end
  end

end