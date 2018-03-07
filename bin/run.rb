# require_relative 'config/environment'
require './config/environment'
require 'pry'



def list_commands
  commands = <<-TEXT

    Type 'quit' to leave program
    --------------------------
    1. List All Directors
    2. List All Movies from a Director
    3. List All Movie Genres from a Director
    4. List Director with the Most Movies
    5. List Movies by Director and Genre
    --------------------------
    6. List All Countries that have Movies on the List
    7. List All Movies from a Country
    --------------------------
    8. List All Movies that Won Oscars
    9. List Movie with Most Oscars
    10. List Oscars by Country
    --------------------------
    11. List All Movies
    12. List Movies from a Year
    13. List Movies from a Range of Years
    --------------------------
    14. List All Genres
    15. List All Movies from a Genre
    16. List Genre with the Most Movies
    --------------------------
    17. List All Actors
    18. List All of an Actor's Movies
    19. List All of a Movie's Actors

    TEXT
  puts commands
end

def do_command(entry=nil)
  case entry
  when "1"
    puts ""
    puts Director.print_director_names
  when "2"
    print "Please enter a director: "
    director_name = gets.chomp
    puts ""
    Director.print_list_of_movies_by_director(director_name)
  when "3"
    print "Please enter director name:"
    name = gets.chomp
    puts ""
    Director.print_genres_of_movies_by_director(name)
  when "4"
    puts ""
    Director.print_director_with_most_movies
  when "5"
    print "Please enter director name: "
    dir_name = gets.chomp
    if Director.find_by(name: dir_name)
      print "Please enter genre: "
      genre = gets.chomp
      puts ""
      if Genre.find_by(name: genre)
        puts Movie.movies_by_director_and_genre(dir_name, genre)
      else
        puts "Invalid input"
      end
    else
      puts "Invalid input"
    end
  when "6"
    puts ""
    Movie.print_list_of_countries
  when "7"
    print "Please enter country name: "
    name = gets.chomp
    puts ""
    Movie.print_list_movies_from_a_country(name)
  when "8"
    puts ""
    # Movie.print_titles(Movie.have_won_oscars)
    Movie.print_have_won_oscars
  when "9"
    puts ""
    puts Movie.movie_with_most_oscars_won[0].name + ", " + Movie.most_oscars_won.to_s
  when "10"
    puts ""
    Movie.oscars_by_country
  when "11"
    puts ""
    Movie.movie_names
  when "12"
    print "Please enter year: "
    year = gets.chomp
    puts ""
    Movie.movies_within_single_year(year)
  when "13"
    puts "Please enter a range of years."
    print "Enter the first year: "
    year1 = gets.chomp
    print "Enter the second year: "
    year2 = gets.chomp
    puts ""
    Movie.movies_within_year_range(year1, year2)
  when "14"
    puts ""
    puts Genre.genre_names
  when "15"
    print "Please enter a genre: "
    genre_name = gets.chomp
    puts ""
    Genre.print_list_movies_from_genre(genre_name)
  when "16"
    puts ""
    Genre.genre_with_the_most_movies
  when "17"
    puts ""
    Actor.print_list_of_all_actor_names
  when "18"
    print "Please enter an actor's name: "
    actor_name = gets.chomp
    puts ""
    Actor.print_get_actors_movie(actor_name)
  when "19"
    print "Please enter a movie: "
    movie_name = gets.chomp
    puts ""
    Movie.print_list_actors_in_movie(movie_name)
  else
    puts "Unable to comply, please check your input and try again."
  end
end



#possibly clear screen first
Gem.win_platform? ? (system "cls") : (system "clear")
puts "Welcome to the Greatest Films of All Time Database"

stay_in_app = true

while(stay_in_app) do
  # puts "What would you like to do? Type 'help' for a list of commands"
  puts "***********************************************************************"
  puts "***********************************************************************"
  puts "Here are a list of commands. What would you like to do?"
  list_commands #function
  print "Please enter a number or 'quit': "
  entry=gets.chomp
  if entry == "quit"
    stay_in_app = false
  else
    do_command(entry)
    puts "***********************************************************************"
    puts "Press enter to continue"
    waiting_on_user = gets.chomp
  end #if
end# while
puts "THANK YOU FOR USING THE DATABASE"
