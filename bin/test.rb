require './config/environment'

puts Actor.all.map{|x| x.name}
