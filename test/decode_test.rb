require_relative 'test_helper'

class DecodeTest < Minitest::Test

  def test_it_exsits
    decode = Decode.new("keder ohulw", "02715", "040895")

    assert_instance_of Decode, decode
  end

end
