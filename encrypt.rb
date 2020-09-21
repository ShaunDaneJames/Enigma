require './lib/enigma'
require './lib/encode'

message = File.open(ARGV[0], "r")
incoming = message.read.chomp
enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming, "02715", "040895")
outgoing = File.open(ARGV[1], "w")

outgoing.write(encrypted_message[:message])

outgoing.close

puts "Created #{outgoing} with the key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"
