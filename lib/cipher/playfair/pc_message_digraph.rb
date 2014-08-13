class PcMessageDigraph

  attr_reader :first_char, :last_char

  def initialize(first_char,last_char)
    match_exp = /^[A-Z]{1}$/
    raise 'Invalid string' unless (first_char.match(match_exp) && last_char.match(match_exp))
    @first_char = first_char
    @last_char  = (first_char!=last_char) ? last_char : 'X'
  end

end