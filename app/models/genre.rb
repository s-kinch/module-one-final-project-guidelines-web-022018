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
end
