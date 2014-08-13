class PcGrid

  attr_reader :key, :to_a, :alphabet

  def initialize(key)
    raise 'Given key does not appear to be valid (it cannot respond to "unique_characters").' unless key.respond_to?(:unique_characters)
    @key = key
    @alphabet = build_alphabet
    @to_a = build_array
  end
  
  def locate(char)
    raise 'Given char is not valid' unless (char.is_a?(String) && char.match(/^[A-Z]{1}$/))
    self.to_a.each_with_index do |col_arr,row_num|
      col_arr.each_with_index do |grid_char,col_num|
        if (char==grid_char || (char=='J' && grid_char=='I'))
          return PcGridCoord.new(row_num,col_num)
        end
      end
    end
    raise 'Could not find char in grid'
  end
  
  def fetch(coord)
    return self.to_a[coord.row][coord.col]
  end
  
  def fetch_right(coord)
    row = coord.row
    col = coord.col+1
    col = 0 if col > 4
    return fetch(PcGridCoord.new(row,col))
  end
  
  def fetch_left(coord)
    row = coord.row
    col = coord.col-1
    col = 4 if col < 0
    return fetch(PcGridCoord.new(row,col))
  end
  
  def fetch_above(coord)
    col = coord.col
    row = coord.row-1
    row = 4 if row < 0
    return fetch(PcGridCoord.new(row,col))
  end
  
  def fetch_below(coord)
    col = coord.col
    row = coord.row+1
    row = 0 if row > 4
    return fetch(PcGridCoord.new(row,col))
  end
  
  def fetch_opposite_corners(first_coord,last_coord)
    f_row = first_coord.row
    f_col = last_coord.col
    first_char = fetch(PcGridCoord.new(f_row,f_col))
    l_row = last_coord.row
    l_col = first_coord.col
    last_char = fetch(PcGridCoord.new(l_row,l_col))
    return (first_char+last_char)
  end

  private
  
  def build_array
    grid  = [[],[],[],[],[]]
    level = 0
    alphabet.each_char do |char|
      grid[level] << char
      level += 1 unless grid[level].length<5
    end
    return grid
  end

  def build_alphabet
    chars = key.unique_characters
    ('A'..'Z').each do |char|
      chars << char unless (chars.include?(char) || char=='J')
    end
    return chars.join
  end

end