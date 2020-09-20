require 'date'
require_relative 'message_data'
require_relative 'shiftable'

class Encrypt < MessageData
include Shiftable
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_number = []
    @a = nil
    @b = nil
    @c = nil
    @d = nil
    @encrypted_message = []
    super(message_data)
  end

  def encrypt_a_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @a
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_b_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @b
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_c_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @c
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encrypt_d_key(count, character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + @d
      @alphabet.rotate(shift_value).first
    else
    character
    end
  end

  def encode_message
    random_5_digit_number
    generate_shifts
    count = 0
    encode_message = []
    while count < @message_data.count
    @message_data.each do |character|
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
