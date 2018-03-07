# require_relative 'config/environment'
require './config/environment'




def list_commands
  commands = <<-TEXT
    1 List All Directors
    2 List All Genres
    3 List All Movies
    4 List Movies From A Year
    5 List Movies From A Range Of Years
    6 List All Movies From A Genre
    7 List All Movies From A Director
    8 List All Movie Genres From A Director
    9 List All Countries That Have Movies On The List
    10 List All Movies From A Country  TEXT
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
  when "5"
    puts "Please enter a range of years."
    print "Enter the first year: "
    year1 = gets.chomp
    print "Enter the second year: "
    year2 = gets.chomp
    Movie.movies_within_year_range(year1, year2)
  when "6"
    print "Please enter a genre: "
    genre_name = gets.chomp
    movies = Genre.find_by(name: genre_name).movies
    Movie.print_titles(movies)
  when "7"
    print "Please enter a director: "
    director_name = gets.chomp
    movies = Director.find_by(name: director_name).movies
    Movie.print_titles(movies)
  when "8"
    print "Please enter director name:"
    name = gets.chomp
    Director.genres_of_movies_by_director(name)
  when "9"
    Movie.print_list_of_countries
  when "10"
    print "Please enter country name: "
    name = gets.chomp
    Movie.list_movies_from_a_country(name)  
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
