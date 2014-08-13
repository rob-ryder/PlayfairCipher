class PcGridShape
  
  attr_reader :coord1, :coord2
  
  def initialize(coord1, coord2)
    @coord1 = coord1
    @coord2 = coord2
  end
  
  def is_rectangle?
    if (coord1.row==coord2.row || coord1.col==coord2.col) then
      return false
    end
    true
  end
  
  def is_column?
    if (coord1.col != coord2.col) then
      return false
    end
    true
  end
  
  def is_row?
    if (coord1.row != coord2.row) then
      return false
    end
    true
  end
  
end