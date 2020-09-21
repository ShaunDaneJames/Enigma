module Shiftable

  def random_5_digit_number
    random_number = []
    5.times do
      random_number << rand(9)
    end
    random_number
  end

  def generate_shifts
    randomly_generated = random_5_digit_number
    generating_shifts = []
    generate_a_shifts = randomly_generated[0..1].join.to_i + offset[0]
    generate_b_shifts = randomly_generated[1..2].join.to_i + offset[1]
    generate_c_shifts = randomly_generated[2..3].join.to_i + offset[2]
    generate_d_shifts = randomly_generated[3..4].join.to_i + offset[3]
    generating_shifts << generate_a_shifts
    generating_shifts << generate_b_shifts
    generating_shifts << generate_c_shifts
    generating_shifts << generate_d_shifts
    generating_shifts
  end

  #possibly combine both offsets with if conditional.
  def get_offsets(date)
    offsets = date.to_i * date.to_i
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end

  def offset
    sq_date_time = Time.now.strftime("%m%d%y").to_i
    offsets = sq_date_time * sq_date_time
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end

  def a_shift(key, date)
    key[0..1].to_i + get_offsets(date)[0]
  end

  def b_shift(key, date)
    key[1..2].to_i + get_offsets(date)[1]
  end

  def c_shift(key, date)
    key[2..3].to_i + get_offsets(date)[2]
  end

  def d_shift(key, date)
    key[3..4].to_i + get_offsets(date)[3]
  end
end
