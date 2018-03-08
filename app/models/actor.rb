class Actor < ActiveRecord::Base
  has_and_belongs_to_many :movies
  has_many :genres, through: :movies

  def self.list_all_actor_names
    self.all.map { |a| a.name}.sort!
  end

  def self.print_list_of_all_actor_names
    puts self.list_all_actor_names
  end

  def self.get_actors_movie(name)
    if self.find_by(name: name)
      self.find_by(name: name).movies.map { |m| m.name}.sort!
    end
  end

  def self.print_get_actors_movie(name)
    puts self.get_actors_movie(name)
  end

  def self.list_genres_for_actor(name)
    self.find_by(name: name).genres.map {|g| g.name}.sort! if self.find_by(name: name)
  end

  def self.print_list_genres_for_actor(name)
    puts self.list_genres_for_actor(name)
  end

  def self.list_actor_with_the_most_movies
    arr = self.all.sort {|a,b| a.movies.count <=> b.movies.count} #sort by count , larger last
    arr.select{ |a| a.movies.count == arr[arr.size-1].movies.count}.map { |a| a.name}
  end

  def self.print_list_actor_with_the_most_movies
    list = self.list_actor_with_the_most_movies
    puts "We have a tie!!!!!" if list.size > 1
    puts list
  end
end
