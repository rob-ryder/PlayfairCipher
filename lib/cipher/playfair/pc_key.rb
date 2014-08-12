class PcKey

  def self.valid?(str)
    return false unless str.is_a?(String) && str.match(/^[A-Z]+$/)
    return true
  end

  attr_reader :key

  def initialize(key)
    raise 'Invalid key.' unless self.class.valid?(key)
    @key = key
  end
  
  def to_s
    return key
  end
  
  def unique_characters
    collection = []
    self.to_s.each_char do |char|
      collection << char unless collection.include?(char)
    end
    return collection
  end
  
end