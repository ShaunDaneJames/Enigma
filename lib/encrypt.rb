class Encrypt
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def random_5_digit_number
    number = []
    4.times do
      number << rand(9)
    end
    number.insert(0, 0)
  end
end
