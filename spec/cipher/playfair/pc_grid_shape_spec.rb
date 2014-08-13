describe PcGridShape do
  
  describe '#initialize' do
    it 'accepts two PcGridCoord objects' do
      first = PcGridCoord.new(0,1)
      last  = PcGridCoord.new(0,1)
      expect{described_class.new(first,last)}.to_not raise_error
    end
  end
  
  describe '#is_rectangle?' do
    it 'returns true if neither row nor column match in the two coord objects' do
      first = PcGridCoord.new(0,1)
      last  = PcGridCoord.new(1,0)
      shape = described_class.new(first,last)
      expect(shape.is_rectangle?).to be true
    end
    it 'returns false if both coord objects have the same row' do
      first = PcGridCoord.new(0,1)
      last  = PcGridCoord.new(0,2)
      shape = described_class.new(first,last)
      expect(shape.is_rectangle?).to be false
    end
    it 'returns false if both coord objects have the same col' do
      first = PcGridCoord.new(3,1)
      last  = PcGridCoord.new(4,1)
      shape = described_class.new(first,last)
      expect(shape.is_rectangle?).to be false
    end
  end

  describe '#is_column?' do
    it 'returns true if both coord objects have the same col' do
      first = PcGridCoord.new(3,1)
      last  = PcGridCoord.new(4,1)
      shape = described_class.new(first,last)
      expect(shape.is_column?).to be true
    end
    it 'returns false if both coord objects DO NOT have the same col' do
      first = PcGridCoord.new(3,2)
      last  = PcGridCoord.new(4,1)
      shape = described_class.new(first,last)
      expect(shape.is_column?).to be false
    end
  end

  describe '#is_row?' do
    it 'returns true if both coord objects have the same row' do
      first = PcGridCoord.new(1,4)
      last  = PcGridCoord.new(1,3)
      shape = described_class.new(first,last)
      expect(shape.is_row?).to be true
    end
    it 'returns false if both coord objects DO NOT have the same row' do
      first = PcGridCoord.new(1,4)
      last  = PcGridCoord.new(2,3)
      shape = described_class.new(first,last)
      expect(shape.is_row?).to be false
    end
  end
  
end