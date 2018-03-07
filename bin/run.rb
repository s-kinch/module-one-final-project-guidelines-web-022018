# require_relative 'config/environment'
require './config/environment'




def list_commands
  commands = <<-TEXT
    1 List All Directors
    2 List All Genres
    3 List All Movies
    4 List Movies From A Year
    # 5 List Movies From A Range Of Years
    # 6 List All Movies From A Genre
    # 7 List All Movies From A Director
    8 List All Movie Genres From A Director
    # 9 List All Countries That Have Movies On The List
    # 10 List All Movies From A Country
  TEXT
  puts commands
end

def do_command(entry=nil)
  # puts "**********#{entry}"
  case entry
  when "1"
    # puts "*******in case"
    puts Director.director_names
  when "2"
    puts Genre.genre_names
  when "3"
    Movie.movie_names
  when "4"
    print "Please enter year: "
    year = gets.chomp
    Movie.movies_within_single_year(year)
  when "8"
    print "Please enter Director name:"
    name = gets.chomp
    Director.genres_of_movies_by_director(name)  
  else
  end
end



#possibly clear screen first
puts "Welcome to the Greatest Films of All Time Database"

stay_in_app = true

while(stay_in_app) do
  # puts "What would you like to do? Type 'help' for a list of commands"
  puts "Here are a list of commands. What would you like to do"
  list_commands #function
  entry=gets.chomp
  # do_command(entry) if entry != "quit"#function
  # stay_in_app = false if entry == "quit"
  if entry == "quit"
    stay_in_app = false
  else
    do_command(entry)
  end #if
  stay_in_app = false
end# while
