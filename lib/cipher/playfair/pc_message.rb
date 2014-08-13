class PcMessage

  def self.valid?(str)
    return false unless str.is_a?(String) && str.match(/^[A-Z]+$/)
    return true
  end
  
  attr_reader :raw, :clean, :digraphs
  
  def initialize(message)
    @raw = message.to_s
    @clean = build_clean
    raise 'Invalid message (cannot be cleaned into a valid message string)' unless self.class.valid?(self.clean)
    @digraphs = build_digraphs
  end
  
  private
  
  def build_clean
    final = ''
    raw.each_char do |char|
      final << char if char.match(/[a-zA-Z]/)
    end
    return final.upcase
  end
  
  def build_digraphs
    digraphs = []
    pair = []
    self.clean.each_char do |char|
      pair << char
      if pair.length==2
        digraphs << PcMessageDigraph.new(pair[0],pair[1])
        pair = []
      end
    end
    if pair.length==1
      pair << 'X'
      digraphs << PcMessageDigraph.new(pair[0],pair[1])
    end
    return digraphs
  end

end