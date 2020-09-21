require 'date'
require_relative 'message_data'
require_relative 'shiftable'

class Encode
include Shiftable
  attr_reader :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @random_number = []
    @encrypted_message = []
  end

  def encrypt_a_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @key[0..1].to_i
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_b_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @key[1..2].to_i
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_c_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @key[2..3].to_i
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_d_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @key[3..4].to_i
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
