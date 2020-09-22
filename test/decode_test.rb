require_relative 'test_helper'

class DecodeTest < Minitest::Test

  def test_it_exsits_with_attributes
    decode = Decode.new("keder ohulw", "02715", "040895")

    assert_instance_of Decode, decode
    assert_equal ("a".."z").to_a << " ", decode.alphabet
    assert_equal "02715", decode.key
    assert_equal "040895", decode.date
  end

end
