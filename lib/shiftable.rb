module Shiftable

  def random_5_digit_number
    random_number = []
    5.times do
      random_number << rand(9)
    end
    random_number
  end

  # def generate_shifts
  #   randomly_generated = random_5_digit_number
  #   generating_shifts = []
  #   generate_a_shifts = randomly_generated[0..1].join.to_i + offset[0]
  #   generate_b_shifts = randomly_generated[1..2].join.to_i + offset[1]
  #   generate_c_shifts = randomly_generated[2..3].join.to_i + offset[2]
  #   generate_d_shifts = randomly_generated[3..4].join.to_i + offset[3]
  #   generating_shifts << generate_a_shifts
  #   generating_shifts << generate_b_shifts
  #   generating_shifts << generate_c_shifts
  #   generating_shifts << generate_d_shifts
  #   generating_shifts
  # end

  def actual_date
    Time.now.strftime("%m%d%y").to_i
  end

  def offset
    date_time = Time.now.strftime("%m%d%y").to_i
    offsets = date_time * date_time
    last_four = offsets.to_s.split("").last(4)
    last_four.map do |number|
      number.to_i
    end
  end

  def a_shift(key, date)
    key[0..1].join.to_i + (date)[0].to_i
  end

  def b_shift(key, date)
    key[1..2].join.to_i + (date)[1].to_i
  end

  def c_shift(key, date)
    key[2..3].join.to_i + (date)[2].to_i
  end

  def d_shift(key, date)
    key[3..4].join.to_i + (date)[3].to_i
  end
end
