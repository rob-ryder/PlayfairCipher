class PcGridCoord
  
  attr_accessor :row, :col
  
  def initialize(row,col)
    @row = row
    @col = col
    raise 'Invalid row or column.' unless valid?
  end
  
  private
  
  def valid?
    [row,col].each {|val| return false unless val.is_a?(Fixnum) && val<5 && val>=0}
    true
  end
  
end