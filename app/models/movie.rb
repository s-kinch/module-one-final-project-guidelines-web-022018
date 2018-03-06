class Movie < ActiveRecord::Base
  belongs_to :director
  belongs_to :genre

  def self.have_won_oscars
    self.all.where("oscars > 0")
  end

  def self.most_oscars_won
    self.all.maximum("oscars")
  end

  def self.title_with_most_oscars_won
    self.all.where("oscars == ?", self.most_oscars_won)
  end
end
