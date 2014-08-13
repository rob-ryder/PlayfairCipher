require_relative 'lib/cipher/playfair_cipher'

cipher = PlayfairCipher.new('VALIDKEYHERE')

encrypted_string = cipher.encrypt('Jim\'s plain text message here.')
decrypted_string = cipher.decrypt(encrypted_string)

puts encrypted_string
puts decrypted_string