class Movie < ActiveRecord::Base
  belongs_to :director
  belongs_to :genre

  def self.have_won_oscars
    self.all.where("oscars > 0")
  end

  def self.most_oscars_won
    self.all.maximum("oscars")
  end

  def self.movie_with_most_oscars_won
    self.all.where("oscars == ?", self.most_oscars_won)
  end

  def self.movies_within_year_range(year1, year2)
    if year1 > year2
      dummy = year1
      year1 = year2
      year2 = dummy
    end

    self.print_titles(self.all.where("year > ? AND year < ?", year1, year2))
    return nil
  end

  def self.print_titles(arr)
    arr.each{|x| puts x.name}
  end

  def self.list_all_countries
    self.all.map do |movie|
      movie.country
    end.uniq.compact.sort
  end

  def self.print_list_of_countries
    puts self.list_all_countries
  end
end
