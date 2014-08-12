describe PcKey do

  describe '.valid?' do
    it 'should return false if given something other than a string' do
      expect(described_class.valid?([])).to be false
      expect(described_class.valid?({})).to be false
      expect(described_class.valid?(0)).to be false
    end
    it 'should return false if string is empty' do
      expect(described_class.valid?('')).to be false
    end
    it 'should return false if string contains non-alphabetic characters' do
      expect(described_class.valid?('BROKEN UP. HAS PUNCTUATION!')).to be false
    end
    it 'should return false if string contains lower-case chars' do
      expect(described_class.valid?('ContainsLowerCaseChars')).to be false
    end
    it 'should return true if string contains only uppercase alphabetic chars' do
      expect(described_class.valid?('FULLYUPPERCASEALPHABETICCHARS')).to be true
    end
  end

  describe '#initialize' do
    it "should return an instance of #{described_class} when given a valid key string" do
      expect(described_class.new('VALIDKEY')).to be_an_instance_of(described_class)
    end
    it 'should raise an error when given an invalid key string' do
      expect{described_class.new('Invalid Key')}.to raise_error
    end
  end
  
  describe '#to_s' do
    it 'should return a string' do
      expect(described_class.new('VALIDKEY').to_s).to be_an_instance_of(String)
    end
    it 'should return a string that exactly matches the string it was initialized with' do
      expect(described_class.new('VALIDKEY').to_s).to match(/^VALIDKEY$/)
    end
  end
  
  describe '#unique_characters' do 
    return_val   = described_class.new('VALIDKEYHERE').unique_characters
    expected_val = ['V','A','L','I','D','K','E','Y','H','R']
    it 'should return an array' do
      expect(return_val).to be_an_instance_of(Array)
    end
    it 'should return the list of unique characters of the key, in order' do
      expect(return_val).to eql(expected_val)
    end
  end
  
end