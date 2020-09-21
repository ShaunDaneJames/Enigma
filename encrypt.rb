message = File.open(ARGV[0], "r")

incoming = message.read

encrypted_message = incoming.upcase

writer = File.open(ARGV[1], "w")

writer.write(encrypted_message)

writer.close
