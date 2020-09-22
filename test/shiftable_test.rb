require_relative 'test_helper'

class ShiftableTest < Minitest::Test

  def test_can_generate_random_5_digit_number
    enigma = Enigma.new

    enigma.stubs(:rand).returns([1,2,3,4,5])
    assert_equal [1,2,3,4,5], enigma.random_5_digit_number.flatten.uniq
  end

  def test_knows_date
    enigma = Enigma.new

    enigma.stubs(:now).returns(210920)
    assert_equal 210920, enigma.actual_date
  end

end
