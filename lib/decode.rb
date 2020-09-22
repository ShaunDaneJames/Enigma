require 'date'
require_relative 'shiftable'

class Decode
  include Shiftable
  attr_reader :alphabet,
              :key,
              :date

  def initialize(message, key, date)
    @message = message.downcase.split("")
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @decrypted_message = []
  end

  def decrypt_a_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index - a_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def decrypt_b_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index - b_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def decrypt_c_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index - c_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def decrypt_d_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index - d_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def decode_message
    count = 0
    while count < @message.count
      @message.each do |character|
        if count == 0 || count % 4 == 0
          @decrypted_message << decrypt_a_key(character)
        elsif count == 1 || count % 4 == 1
          @decrypted_message << decrypt_b_key(character)
        elsif count == 2 || count % 4 == 2
          @decrypted_message << decrypt_c_key(character)
        elsif count == 3 || count % 4 == 3
          @decrypted_message << decrypt_d_key(character)
        end
        count += 1
        @decrypted_message
      end
    end
    @decrypted_message.join
  end
end
