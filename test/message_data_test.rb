require_relative 'test_helper'

class MessageDataTest < Minitest::Test

  def test_it_exsits
    txt_file = './message_to_encrypt.txt'
    message = MessageData.new(txt_file)

    assert_instance_of MessageData, message
    assert_equal ["y", "o", "u"], message.message_data.first(3)  
  end

end
