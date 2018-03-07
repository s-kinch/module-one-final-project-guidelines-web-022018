class Movie < ActiveRecord::Base
  belongs_to :director
  belongs_to :genre
  has_and_belongs_to_many :actors

  def self.have_won_oscars
    self.all.where("oscars > 0").map {|m| m.name}.sort!
  end

  def self.print_have_won_oscars
    puts self.have_won_oscars
  end

  def self.most_oscars_won
    self.all.maximum("oscars")
  end

  def self.movie_with_most_oscars_won
    self.all.where("oscars == ?", self.most_oscars_won)
  end

  def self.movies_within_single_year(year)
    self.print_titles(self.all.where("year == ?", year))
  end

  def self.movies_within_year_range(year1, year2)
    if year1 > year2
      dummy = year1
      year1 = year2
      year2 = dummy
    end

    self.print_titles(self.all.where("year >= ? AND year <= ?", year1, year2))
    return nil
  end

  def self.print_titles(arr)
    arr.each{|x| puts x.name}
  end

  def self.movie_names
    names = self.all.map do |d|
      d.name
    end.uniq.sort
    names.each { |n| puts n}
  end

  def self.list_all_countries
    self.all.map do |movie|
      movie.country
    end.uniq.compact.sort
  end

  def self.print_list_of_countries
    puts self.list_all_countries
  end

  def self.list_movies_from_a_country(country)
    self.all.where("country == ?",country).map { |m| m.name}.sort!
  end

  def self.print_list_movies_from_a_country(country)
    puts self.list_movies_from_a_country(country)
  end


  def self.oscars_by_country
    hash = {}
    self.have_won_oscars.each do |movie|
    # binding.pry
      # if movie.country
      if Movie.find_by(name: movie).country
        # hash[movie.country] ||= 0
        hash[Movie.find_by(name: movie).country] ||= 0
        # hash[movie.country] += 1
        hash[Movie.find_by(name: movie).country] += 1
      end
    end
    output_array = []
    hash.each do |k,v|
      output = k + ", " + v.to_s + " Oscar"
      if v > 1
        output += "s"
      end
      output_array << [k,output]
      # puts output
    end
    output_array.sort!{|x,y| x[0] <=>y[0]}.each { |val| puts val[1]}
    return nil
  end

  def self.movies_by_director_and_genre(director_name, genre_name)
    director = Director.find_by(name: director_name)
    genre = Genre.find_by(name: genre_name)

    self.all.where("director_id == ? AND genre_id == ?", director, genre).map{|x| x.name}
  end

  def self.list_actors_in_movie(name)
    if self.find_by(name: name)
      self.find_by(name: name).actors.map { |m| m.name}.sort!
    end
  end

  def self.print_list_actors_in_movie(name)
    puts self.list_actors_in_movie(name)
  end
end
