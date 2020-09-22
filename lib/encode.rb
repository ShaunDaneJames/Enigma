require 'date'
require_relative 'shiftable'

class Encode
include Shiftable
  attr_reader :alphabet,
              :key,
              :date

  def initialize(message, key, date)
    @message = message.downcase.split("")
    @key = key
    @date = date
    @alphabet = ("a".."z").to_a << " "
    @encrypted_message = []
  end

  def encrypt_a_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + a_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def encrypt_b_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + b_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def encrypt_c_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + c_shift(@key, @date)
      @alphabet.rotate(shift_value).first
    else
      character
    end
  end

  def encrypt_d_key(character)
    if @alphabet.include?(character)
      original_index = @alphabet.find_index(character)
      shift_value = original_index + d_shift(@key, @date)
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
          @encrypted_message << encrypt_a_key(character)
        elsif count == 1 || count % 4 == 1
          @encrypted_message << encrypt_b_key(character)
        elsif count == 2 || count % 4 == 2
          @encrypted_message << encrypt_c_key(character)
        elsif count == 3 || count % 4 == 3
          @encrypted_message << encrypt_d_key(character)
        end
        count += 1
        @encrypted_message
      end
    end
    @encrypted_message.join
  end

end
