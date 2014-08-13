describe PlayfairCipher do

  let(:invalid_key_string) {
    'Invalid key here.'
  }
  let(:valid_key_string) {
    'VALIDKEYHERE'
  }
  
  describe '#initialize' do
    it 'raises an error if not given a valid key string' do
      expect{described_class.new(invalid_key_string)}.to raise_error
    end
    it "returns an instance of #{described_class} when given a valid key string" do
      expect(described_class.new(valid_key_string)).to be_an_instance_of(described_class)
    end
  end
  
  describe '#encrypt' do
    pending
  end

  describe '#decrypt' do
    pending
  end
  
end