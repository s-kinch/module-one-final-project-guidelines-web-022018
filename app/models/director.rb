class Director < ActiveRecord::Base
  has_many :movies
  has_many :genres, through: :movies

  def self.director_with_most_movies
    self.all.sort{ |a,b| a.movies.count <=> b.movies.count}.last.name #highest is last
  end

  def self.print_director_with_most_movies
    puts self.director_with_most_movies
  end

  def self.director_names
    self.all.map{|d| d.name}.uniq.sort!
  end

  def self.print_director_names
    puts self.director_names
  end

  def self.list_of_movies_by_director(name)
    if self.find_by(name: name)
      self.find_by(name: name).movies.map { |m| m.name  }.sort!
    else
      output = "Sorry, #{name} not found."
      matches = self.all.where("name LIKE ?", "%#{name}%").map{ |m| m.name }.sort!
      matches.length > 0 ? output + " Try: " + matches.join(', ') : output 
    end
  end

  def self.print_list_of_movies_by_director(name)
    puts self.list_of_movies_by_director(name)
  end

  def self.genres_of_movies_by_director(name)
    self.find_by(name: name).genres.map { |genre| genre.name  }.uniq.sort! if self.find_by(name: name)
  end

  def self.print_genres_of_movies_by_director(name)
    puts self.genres_of_movies_by_director(name)
  end
end
