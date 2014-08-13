require_relative 'lib/cipher/playfair_cipher'

puts 'Please enter your encryption key.'
key_string = gets.to_s.strip

begin
  cipher = PlayfairCipher.new(key_string)
  puts "\nCipher ready."
rescue Exception => e
  abort( "\nError: "+e.message )
end

failsafe = 0
while failsafe<1000 do

  puts "\nPlease select an option:\n[1] Encrypt\n[2] Decrypt\n[3] Exit"
  choice = gets.to_s.strip

  if choice=='1' then
    puts "\nPlease enter a string to encrypt."
    string = gets.to_s.strip
    begin
      puts "\nENCRYPTED: "+cipher.encrypt(string)
      next
    rescue Exception => e
      abort( "\nError: "+e.message )
    end
  elsif choice=='2' then
    puts "\nPlease enter a string to decrypt."
    string = gets.to_s.strip
    begin
      puts "\nDECRYPTED: "+cipher.decrypt(string)
      next
    rescue Exception => e
      abort( "\nError: "+e.message )
    end
  elsif choice=='3' then
    puts "\nGoodbye."
    break
  else
    puts "\nSelection not recognised."
    next
  end
  
  failsafe += 1
  
end