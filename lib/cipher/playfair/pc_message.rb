class PcMessage

  def self.valid?(str)
    return false unless str.is_a?(String) && str.match(/^[A-Z]+$/)
    return true
  end
  
  attr_reader :raw
  
  def initialize(message)
    @raw = message.to_s
    raise 'Invalid message (cannot be cleaned into a valid message string)' unless self.class.valid?(self.clean)
  end
  
  def clean
    final = ''
    raw.each_char do |char|
      final << char if char.match(/[a-zA-Z]/)
    end
    return final.upcase
  end
  
  def character_pairs
    pairs = []
    pair = []
    self.clean.each_char do |char|
      pair << char
      if pair.length==2
        pairs << pair.join
        pair = []
      end
    end
    if pair.length
      pair << 'X'
      pairs << pair.join
    end
    return pairs
  end
  
end