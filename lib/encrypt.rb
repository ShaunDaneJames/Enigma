class Encrypt
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @random = rand(10000..99999)
    require "pry"; binding.pry
  end
end
