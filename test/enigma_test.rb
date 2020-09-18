require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exsits
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

end
