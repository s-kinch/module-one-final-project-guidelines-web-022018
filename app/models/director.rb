class Director < ActiveRecord::Base
  has_many :movies
  has_many :genres, through: :movies

  def self.director_with_most_movies
    dir_with_most_movies = nil
    self.all.each do |d|
      # dir_with_most_movies = d if d.movies.count > dir_with_most_movies.movies.count unless dir_with_most_movies.nil?
      if dir_with_most_movies.nil?
        dir_with_most_movies = d
      end
      if d.movies.count > dir_with_most_movies.movies.count
        dir_with_most_movies = d
      end
    end
    puts dir_with_most_movies.name
  end

  def self.director_names
    names = self.all.map do |d|
      d.name
    end.uniq.sort
    names.each { |n| puts n}
  end

  def self.list_of_movies_by_director(name)
    self.find_by(name: name).movies.map { |m| m.name  }.sort! if self.find_by(name: name)
  end

  def self.print_list_of_movies_by_director(name)
    puts self.list_of_movies_by_director(name)
  end

  def self.genres_of_movies_by_director(name)
    self.find_by(name: name).genres.map { |genre| genre.name  }.sort! if self.find_by(name: name)
  end

  def self.print_genres_of_movies_by_director(name)
    puts self.genres_of_movies_by_director(name)
  end
end
