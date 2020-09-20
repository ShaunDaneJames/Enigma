require 'date'
require_relative 'message_data'

class Encrypt < MessageData
  attr_reader :alphabet

  def initialize
    #include shiftable
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
    @encrypted_message
  end


  #>>>>>>>>>>>shiftable?
  def random_5_digit_number
    5.times do
      @random_number << rand(9)
    end
  end

  def generate_shifts
    @a = @random_number[0..1].join.to_i + offset[0]
    @b = @random_number[1..2].join.to_i + offset[1]
    @c = @random_number[2..3].join.to_i + offset[2]
    @d = @random_number[3..4].join.to_i + offset[3]
  end

  def offset
    sq_date_time = Time.now.strftime("%m%d%y").to_i
    offsets = sq_date_time * sq_date_time
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end
  #<<<<<<<<<<<<shiftable?
end
