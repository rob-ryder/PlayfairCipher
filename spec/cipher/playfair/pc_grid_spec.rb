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
  
  describe '#locate' do
    it 'raises an error if string given is not a single uppercase letter' do
      expect{obj.locate([])}.to raise_error
      expect{obj.locate('')}.to raise_error
      expect{obj.locate('1')}.to raise_error
      expect{obj.locate('AB')}.to raise_error
      expect{obj.locate('c')}.to raise_error
    end
    it 'returns a PcGridCoord object' do
      expect(obj.locate('Z')).to be_an_instance_of(PcGridCoord)
    end
    it 'returns the correct location (2,1) of "C" in the grid' do
      coord_obj = obj.locate('C')
      expect(coord_obj.row).to eql(2)
      expect(coord_obj.col).to eql(1)
    end
    it 'returns the correct location (4,4) of "Z" in the grid' do
      coord_obj = obj.locate('Z')
      expect(coord_obj.row).to eql(4)
      expect(coord_obj.col).to eql(4)
    end
    it 'returns the correct location (0,0) of "V" in the grid' do
      coord_obj = obj.locate('V')
      expect(coord_obj.row).to eql(0)
      expect(coord_obj.col).to eql(0)
    end
    it 'returns the correct location (0,3) of "J" in the grid ("J" shares with "I")' do
      coord_obj = obj.locate('J')
      expect(coord_obj.row).to eql(0)
      expect(coord_obj.col).to eql(3)
    end
  end
  
  describe '#fetch' do
    it 'returns a string' do
      coord_obj = PcGridCoord.new(0,0)
      expect(obj.fetch(coord_obj)).to be_an_instance_of(String)
    end
    it 'returns the correct char ("C") for coords 2,1' do
      coord_obj = PcGridCoord.new(2,1)
      expect(obj.fetch(coord_obj)).to eql('C')
    end
    it 'returns the correct char ("Z") for coords 4,4' do
      coord_obj = PcGridCoord.new(4,4)
      expect(obj.fetch(coord_obj)).to eql('Z')
    end
    it 'returns the correct char ("V") for coords 0,0' do
      coord_obj = PcGridCoord.new(0,0)
      expect(obj.fetch(coord_obj)).to eql('V')
    end
    it 'returns the correct char ("I") for coords 0,3' do
      coord_obj = PcGridCoord.new(0,3)
      expect(obj.fetch(coord_obj)).to eql('I')
    end
  end
  
end