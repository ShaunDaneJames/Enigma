require 'date'
require_relative 'message_data'
require_relative 'shiftable'

class Encode
include Shiftable
  attr_reader :alphabet

  def initialize(message, key, date)
    @message = message.downcase.split("")
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @random_number = []
    @encrypted_message = []
    @a_shift = nil
    @b_shift = nil
    @c_shift = nil
    @d_shift = nil
  end

  def get_offsets(date)
    offsets = date.to_i * date.to_i
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
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

  def encrypt_a_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @a_shift
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_b_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @b_shift
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_c_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @c_shift
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_d_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @d_shift
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encode_message
    count = 0
    while count < @message.count
    @message.each do |character|
        if count == 0 || count % 4 == 0
          @encrypted_message << encrypt_a_key(count, character)
        elsif count == 1 || count % 4 == 1
          @encrypted_message << encrypt_b_key(count, character)
        elsif count == 2 || count % 4 == 2
          @encrypted_message << encrypt_c_key(count, character)
        elsif count == 3 || count % 4 == 3
          @encrypted_message << encrypt_d_key(count, character)
        end
        count += 1
        @encrypted_message
      end
    end
    @encrypted_message.join
  end

end
