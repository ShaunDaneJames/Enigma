require_relative 'test_helper'

class EncryptTest < Minitest::Test

  def test_it_exsits
    encrypt = Encrypt.new

    assert_instance_of Encrypt, encrypt
  end

  def test_knows_alphabet_and_generates_random_number
    encrypt = Encrypt.new

    expected = ("a".."z").to_a << " "

    assert_equal expected, encrypt.alphabet
  end

  def test_can_pad_random_number_with_zero
    encrypt = Encrypt.new

    encrypt.random_5_digit_number
  end

  
end
