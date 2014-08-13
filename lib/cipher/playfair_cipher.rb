require_relative 'playfair/pc_key'
require_relative 'playfair/pc_grid'
require_relative 'playfair/pc_grid_coord'
require_relative 'playfair/pc_grid_shape'
require_relative 'playfair/pc_message'

class PlayfairCipher
  
  attr_reader :key, :grid
  
  def initialize(keyString)
    @key = PcKey.new(keyString)
    @grid = PcGrid.new(key)
  end
  
  def encrypt(string)
    
  end

  def decrypt(string)

  end
  
end