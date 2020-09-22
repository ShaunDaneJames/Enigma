require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :encrypted,
              :decrypted

  def initialize
    @encrypted = Hash.new
    @decrypted = Hash.new
  end

  def encrypt(message, key = random_5_digit_number, date = actual_date)
    if key.class == String
      key = key.split("").map {|key| key.to_i}
    end
    encode = Encode.new(message, key, date)
    encode.a_shift(key, date)
    encode.b_shift(key, date)
    encode.c_shift(key, date)
    encode.d_shift(key, date)
    @encrypted[:message] = encode.encode_message
    @encrypted[:key] = key.join
    @encrypted[:date] = date
    @encrypted
  end

  def decrypt(message, key = random_5_digit_number, date = actual_date)
    if key.class == String
      key = key.split("").map {|key| key.to_i}
    end
    decode = Decode.new(message, key, date)
    decode.a_shift(key, date)
    decode.b_shift(key, date)
    decode.c_shift(key, date)
    decode.d_shift(key, date)
    @decrypted[:message] = decode.decode_message
    @decrypted[:key] = key.join
    @decrypted[:date] = date
    @decrypted
  end
end
