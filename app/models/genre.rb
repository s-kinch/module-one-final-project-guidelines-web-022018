class Genre < ActiveRecord::Base
  has_many :movies
  has_many :directors, through: :movies

  def self.genre_with_the_most_movies
    current_top_genre= nil
    self.all.each do |g|
      current_top_genre = g if current_top_genre.nil?
      current_top_genre = g if g.movies.count > current_top_genre.movies.count
    end
    # puts "**************TOP GENRE IS!:::#{current_top_genre.name}"
    puts "#{current_top_genre.name}"
  end


    def self.genre_names
      self.all.map { |g| g.name}.uniq.sort!
    end

    def self.print_genre_names
      puts self.genre_names
    end

    def self.list_movies_from_genre(name)
      self.find_by(name: name).movies.map { |m| m.name}.sort!  if self.find_by(name: name)
    end

    def self.print_list_movies_from_genre(genre)
      puts self.list_movies_from_genre(genre)
    end
end
