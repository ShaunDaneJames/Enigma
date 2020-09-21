module Shiftable

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

  def generate_a_shift
  end 
end
