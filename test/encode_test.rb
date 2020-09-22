require_relative 'test_helper'

class EncodeTest < Minitest::Test

  def test_it_exsits
    encode = Encode.new("hello world", "02715", "040895")

    assert_instance_of Encode, encode
  end

  def test_knows_alphabet
    encode = Encode.new("hello world", "02715", "040895")

    expected = ("a".."z").to_a << " "

    assert_equal expected, encode.alphabet
  end
end
