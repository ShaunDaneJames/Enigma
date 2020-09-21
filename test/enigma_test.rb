require_relative 'test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exsits
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_can_encrypt
    enigma = Enigma.new

    expected = {
                message: "keder ohulw",
                key: "02715",
                date: "040895"
               }

    assert_equal expected, enigma.encrypt("Hello World", "02715", "040895")
  end

  # def test_can_decrypt
  #   enigma = Enigma.new
  #   ("02715", "040895")
  # end

end
