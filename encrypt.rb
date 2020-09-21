require './lib/enigma'
require './lib/encode'

message = File.open(ARGV[0], "r")
incoming = message.read.chomp
enigma = Enigma.new
encrypting_message = enigma.encrypt(incoming)
outgoing = File.open(ARGV[1], "w")

outgoing.write(encrypting_message[:message])

outgoing.close

puts "Created #{ARGV[1]} with the key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"
