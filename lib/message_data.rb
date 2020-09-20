class MessageData
  attr_reader :message_data

  def initialize(message_data)
    @message_data = self.read_message
  end

  def read_message
    characters = File.read('./message_to_encrypt.txt').downcase.chomp.split("")
  end
end
