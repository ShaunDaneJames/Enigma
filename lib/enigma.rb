require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :encrypted,
              :decrypted

  def initialize
    @encrypted = Hash.new
    @decrypted = Hash.new
  end

  def encrypt(message, key = generate_shifts, date = offset)
    encode = Encode.new(message, key, date)
    a_shift(key, date)
    b_shift(key, date)
    c_shift(key, date)
    d_shift(key, date)
    @encrypted[:message] = encode.encode_message
    @encrypted[:key] = key
    @encrypted[:date] = date
  end

  def a_shift(key, date)
    @a_shift = key[0..1].to_i + get_offsets(date)[0]
  end

  def b_shift(key, date)
    @b_shift = key[1..2].to_i + get_offsets(date)[1]
  end

  def c_shift(key, date)
    @c_shift = key[2..3].to_i + get_offsets(date)[2]
  end

  def d_shift(key, date)
    @d_shift = key[3..4].to_i + get_offsets(date)[3]
  end

  def get_offsets(date)
    offsets = date.to_i * date.to_i
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end
end
