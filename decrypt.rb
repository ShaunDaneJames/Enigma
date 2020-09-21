require './lib/enigma'
require './lib/decode'

message = File.open(ARGV[0], "r")
incoming = message.read.chomp
enigma = Enigma.new
decrypting_message = enigma.decrypt(incoming)
outgoing = File.open(ARGV[1], "w")

outgoing.write(decrypting_message[:message])

outgoing.close

puts "Created #{ARGV[1]} with the key #{enigma.decrypted[:key]} and date #{enigma.decrypted[:date]}"
