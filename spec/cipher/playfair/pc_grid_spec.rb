describe PcGrid do

  let(:invalid_key) {
    'INVALIDKEYHERE'
  }

  let(:valid_key) {
    PcKey.new('VALIDKEYHERE')
  }

  let(:obj){
    PcGrid.new(valid_key)
  }
  
  let(:alphabet_string){
    'VALIDKEYHRBCFGMNOPQSTUWXZ'
  }

  let(:obj_as_array){[
    ['V','A','L','I','D'],
    ['K','E','Y','H','R'],
    ['B','C','F','G','M'],
    ['N','O','P','Q','S'],
    ['T','U','W','X','Z']
  ]}
  
  describe '#initialize' do
    it "returns a #{described_class} object when initialized with a valid key" do
      expect(described_class.new(valid_key)).to be_an_instance_of(described_class)
    end
    it 'raises an error when given key object cannot respond to "unique_characters"' do
      expect{described_class.new(invalid_key)}.to raise_error
    end
  end
  
  describe '#alphabet' do
    it 'returns a valid Playfair Cipher alphabet string, for it\'s key' do
      expect(obj.alphabet).to eql(alphabet_string)
    end
  end
  
  describe '#to_a' do
    it 'returns a valid Playfair Cipher grid array for it\'s key' do
      expect(obj.to_a).to eql(obj_as_array)
    end
  end
  
end