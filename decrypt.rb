require './lib/enigma'
require './lib/decode'

enigma = Enigma.new
message = File.open(ARGV[0], "r")
incoming = message.read.chomp
outgoing = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]
decrypting_message = enigma.decrypt(incoming, key)

outgoing.write(decrypting_message[:message])
outgoing.close

puts "Created #{ARGV[1]} with the key #{enigma.decrypted[:key]} and date #{enigma.decrypted[:date]}"
