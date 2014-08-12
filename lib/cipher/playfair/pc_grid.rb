class PcGrid

  attr_reader :key

  def initialize(key)
    raise 'Given key does not appear to be valid (it cannot respond to "unique_characters").' unless key.respond_to?(:unique_characters)
    @key = key
  end

  def to_a
    grid  = [[],[],[],[],[]]
    level = 0
    alphabet.each_char do |char|
      grid[level] << char
      level += 1 unless grid[level].length<5
    end
    return grid
  end

  def alphabet
    chars = key.unique_characters
    ('A'..'Z').each do |char|
      chars << char unless (chars.include?(char) || char=='J')
    end
    return chars.join
  end

end