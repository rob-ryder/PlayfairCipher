class PcMapper

  def self.clean_string(str)
    final = ''
    str.each_char do |char|
      final << char if char.match(/[a-zA-Z]/)
    end
    return final.upcase
  end

  def self.valid_string?(str)
    return false unless str.match(/^[A-Z]+$/)
    return true
  end
  
end