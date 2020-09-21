require './lib/shiftable'

class Enigma
  attr_reader :encrypted,
              :decrypted

  def initialize
    @encrypted = Hash.new
    @decrypted = Hash.new
  end

  def encrypt(message, key = generate_shifts, date = offset)
    encode = Encode.new(message, key, date)
    encode.a_shift(key, date)
    encode.b_shift(key, date)
    encode.c_shift(key, date)
    encode.d_shift(key, date)
    @encrypted[:message] = encode.encode_message
    @encrypted[:key] = key
    @encrypted[:date] = date
    @encrypted
  end


end
