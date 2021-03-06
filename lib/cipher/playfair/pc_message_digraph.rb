class PcMessageDigraph

  attr_reader :first_char, :last_char

  def initialize(first_char,last_char)
    match_exp = /^[A-Z]{1}$/
    raise 'Invalid string' unless (first_char.match(match_exp) && last_char.match(match_exp))
    @first_char = first_char
    @last_char  = last_char
  end
  
  def remove_duplicates
    @last_char='X' if first_char==last_char
  end

end