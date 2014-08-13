describe PcGridCoord do
  
  describe '#initialize' do
    it "returns a #{described_class} object when initialized with a valid row and col" do
      expect(described_class.new(0,4)).to be_an_instance_of(described_class)
    end
    it 'raises an error when initialized with invalid row or col' do
      expect{described_class.new(5,-1)}.to raise_error
    end
  end
  
  describe '#row' do
    coord = described_class.new(0,4)
    it 'returns a Fixnum' do
      expect(coord.row).to be_an_instance_of(Fixnum)
    end
    it 'returns the same row value that it was initialized with' do
      expect(coord.row).to eql(0)
    end
  end

  describe '#col' do
    coord = described_class.new(0,4)
    it 'returns a Fixnum' do
      expect(coord.col).to be_an_instance_of(Fixnum)
    end
    it 'returns the same col value that it was initialized with' do
      expect(coord.col).to eql(4)
    end
  end
  
end