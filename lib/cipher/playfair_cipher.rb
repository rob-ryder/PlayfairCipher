require_relative 'playfair/pc_key'
require_relative 'playfair/pc_grid'
require_relative 'playfair/pc_grid_coord'
require_relative 'playfair/pc_grid_shape'
require_relative 'playfair/pc_message'
require_relative 'playfair/pc_message_digraph'

class PlayfairCipher
  
  attr_reader :key, :grid
  
  def initialize(keyString)
    @key = PcKey.new(keyString)
    @grid = PcGrid.new(key)
  end
  
  def encrypt(string)
    encrypted = ''
    message = PcMessage.new(string)
    message.digraphs.each do |digraph|
      first_char_coords  = grid.locate(digraph.first_char)
      second_char_coords = grid.locate(digraph.last_char)
      pair_shape = PcGridShape.new(first_char_coords,second_char_coords)
      if pair_shape.is_row? then
        encrypted << grid.fetch_right(first_char_coords)
        encrypted << grid.fetch_right(second_char_coords)
      elsif pair_shape.is_column? then
        encrypted << grid.fetch_below(first_char_coords)
        encrypted << grid.fetch_below(second_char_coords)
      elsif pair_shape.is_rectangle? then
        encrypted << grid.fetch_opposite_corners(first_char_coords,second_char_coords)
      else
        raise 'cannot determine pair shape'
      end
    end
    return encrypted
  end

  def decrypt(string)
    decrypted = ''
    message = PcMessage.new(string)
    message.digraphs.each do |digraph|
      first_char_coords  = grid.locate(digraph.first_char)
      second_char_coords = grid.locate(digraph.last_char)
      pair_shape = PcGridShape.new(first_char_coords,second_char_coords)
      if pair_shape.is_row? then
        decrypted << grid.fetch_left(first_char_coords)
        decrypted << grid.fetch_left(second_char_coords)
      elsif pair_shape.is_column? then
        decrypted << grid.fetch_above(first_char_coords)
        decrypted << grid.fetch_above(second_char_coords)
      elsif pair_shape.is_rectangle? then
        decrypted << grid.fetch_opposite_corners(first_char_coords,second_char_coords)
      else
        raise 'cannot determine pair shape'
      end
    end
    return decrypted
  end
  
end