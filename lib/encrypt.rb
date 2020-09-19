require 'date'

class Encrypt
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random_number = []
    @a = nil
    @b = nil
    @c = nil
    @d = nil
  end

  def random_5_digit_number
    4.times do
      @random_number << rand(9)
    end
    @random_number.insert(0, 0)
  end

  def generate_keys
    @a = @random_number[0..1].join.to_i + offset[0]
    @b = @random_number[1..2].join.to_i + offset[1]
    @c = @random_number[2..3].join.to_i + offset[2]
    @d = @random_number[3..4].join.to_i + offset[3]
    require "pry"; binding.pry
  end

  def offset
    sq_date_time = Time.now.strftime("%m%d%y").to_i
    offsets = sq_date_time * sq_date_time
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end
end
