class Genre < ActiveRecord::Base
  has_many :movies
  has_many :directors, through: :movies
  has_many :actors, through: :movies


  def self.genre_with_the_most_movies
    arr = self.all.sort{|a,b| a.movies.count <=> b.movies.count}
    high_count = arr.last.movies.count
    arr.map{|m| m.name if m.movies.count == high_count}.compact!
  end

  def self.print_genre_with_the_most_movies
    most_movies = self.genre_with_the_most_movies
    puts "There was a tie!" if most_movies.length > 1
    puts most_movies.sort!
  end

  def self.genre_names
    self.all.map { |g| g.name}.uniq.sort!
  end

  def self.print_genre_names
    puts self.genre_names
  end

# .where('lower(name) == ?', name.downcase)[0]
  def self.list_movies_from_genre(name)
    # self.find_by(name: name).movies.map { |m| m.name}.sort!  if self.find_by(name: name)
    # self.where('lower(name) == ?', name.downcase)[0].nil?#.movies.map { |m| m.name}.sort!  if self.where('lower(name) == ?', name.downcase)[0]
    if self.where('lower(name) == ?', name.downcase).exists?
      self.where('lower(name) == ?', name.downcase)[0].movies.map { |m| m.name}.sort!
    # else

    end
  end

  def self.print_list_movies_from_genre(genre)
    puts self.list_movies_from_genre(genre)
  end

  def self.list_actors_from_genre(name)
    # Genre.find_by(name: genre).actors.map{|a| a.name}.sort! if Genre.find_by(name: genre)
    if self.where('lower(name) == ?', name.downcase).exists?
      self.where('lower(name) == ?', name.downcase)[0].actors.map{|a| a.name}.sort!
    end
  end

  def self.print_list_actors_from_genre(genre)
    puts self.list_actors_from_genre(genre)
  end
end
