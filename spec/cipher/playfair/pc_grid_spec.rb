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

  describe '#fetch_right' do
    it 'returns the char one step right of the given coord' do
      coord = PcGridCoord.new(0,0)
      expect(obj.fetch_right(coord)).to eql('A')
    end
    it 'returns the leftmost char, if rightmost coord is given' do
      coord = PcGridCoord.new(0,4)
      expect(obj.fetch_right(coord)).to eql('V')
    end
  end
  
  describe '#fetch_left' do
    it 'returns the char one step left of the given coord' do
      coord = PcGridCoord.new(4,4)
      expect(obj.fetch_left(coord)).to eql('X')
    end
    it 'returns the rightmost char, if leftmost coord is given' do
      coord = PcGridCoord.new(4,0)
      expect(obj.fetch_left(coord)).to eql('Z')
    end
  end

  describe '#fetch_above' do
    it 'returns the char one step above of the given coord' do
      coord = PcGridCoord.new(4,4)
      expect(obj.fetch_above(coord)).to eql('S')
    end
    it 'returns the bottom-most char, if top-most coord is given' do
      coord = PcGridCoord.new(0,4)
      expect(obj.fetch_above(coord)).to eql('Z')
    end
  end

  describe '#fetch_below' do
    it 'returns the char one step below of the given coord' do
      coord = PcGridCoord.new(0,0)
      expect(obj.fetch_below(coord)).to eql('K')
    end
    it 'returns the top-most char, if bottom-most coord is given' do
      coord = PcGridCoord.new(4,0)
      expect(obj.fetch_below(coord)).to eql('V')
    end
  end

  describe '#fetch_opposite_corners' do
    it 'returns the chars from the opposite corners of the given coords' do
      first_coord = PcGridCoord.new(2,1)
      last_coord  = PcGridCoord.new(4,4)
      expect(obj.fetch_opposite_corners(first_coord,last_coord)).to eql('MU')
    end
  end

end