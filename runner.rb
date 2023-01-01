require './lib/jungle_beat'
require './lib/linkedlist'
require './lib/node'

print "Welcome to Jungle Beat. Please enter what you want the computer to say, and type quit to quit:"
entry = gets.chomp
until entry == "quit"
  jb = JungleBeat.new
  jb.append(entry)
  jb.play
  entry = gets.chomp
end
