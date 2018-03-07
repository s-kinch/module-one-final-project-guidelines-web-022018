# require_relative 'config/environment'
require './config/environment'
require 'pry'



def list_commands
  commands = <<-TEXT
    Type quit to leave program
    1 List All Directors
    2 List All Genres
    3 List All Movies
    4 List Movies From A Year
    5 List Movies From A Range Of Years
    6 List All Movies From A Genre
    7 List All Movies From A Director
    8 List All Movie Genres From A Director
    9 List All Countries That Have Movies On The List
    10 List All Movies From A Country
    11 List Director With The Most Movies
    12 List All Movies That Won Oscars
    13 List Movie With Most Oscars
    14 List Oscars By Country
    15 List Movies By Director And Genre
    16 List Genre With The Most Movies
    17 List All Actors
    18 List All Of An Actor's Movies
    19 List All Of A Movie's Actors
    TEXT
  puts commands
end

def do_command(entry=nil)
  case entry
  when "1"
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
    Genre.print_list_movies_from_genre(genre_name)
  when "7"
    print "Please enter a director: "
    director_name = gets.chomp
    Director.print_list_of_movies_by_director(director_name)
  when "8"
    print "Please enter director name:"
    name = gets.chomp
    Director.print_genres_of_movies_by_director(name)
  when "9"
    Movie.print_list_of_countries
  when "10"
    print "Please enter country name: "
    name = gets.chomp
    Movie.list_movies_from_a_country(name)
  when "11"
    Director.director_with_most_movies
  when "12"
    Movie.print_titles(Movie.have_won_oscars)
  when "13"
    puts Movie.movie_with_most_oscars_won[0].name + ", " + Movie.most_oscars_won.to_s
  when "14"
    Movie.oscars_by_country
  when "15"
    print "Please enter director name: "
    dir_name = gets.chomp
    if Director.find_by(name: dir_name)
      print "Please enter genre: "
      genre = gets.chomp
      if Genre.find_by(name: genre)
        puts Movie.movies_by_director_and_genre(dir_name, genre)
      else
        puts "Invalid input"
      end
    else
      puts "Invalid input"
    end
  when "16"
    Genre.genre_with_the_most_movies
  when "17"
    Actor.print_list_of_all_actor_names
  when "18"
    print "Please enter an actor's name: "
    actor_name = gets.chomp
    Actor.print_get_actors_movie(actor_name)
  when "19"
    print "Please enter a movie: "
    movie_name = gets.chomp
    Movie.print_list_actors_in_movie(movie_name)
  else
    puts "Unable to comply, please check your input and try again."
  end
end



#possibly clear screen first
puts "Welcome to the Greatest Films of All Time Database"

stay_in_app = true

while(stay_in_app) do
  # puts "What would you like to do? Type 'help' for a list of commands"
  puts "***********************************************************************"
  puts "***********************************************************************"
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
  # stay_in_app = false
end# while
puts "THANK YOU FOR USING THE DATABASE"
