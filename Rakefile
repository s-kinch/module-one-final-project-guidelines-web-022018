require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require "csv"

desc 'starts a console'
task :console do
  Pry.start
end

namespace :import do
  desc "Import cars from CSV"
  # task films: :environment do
  task :films  do
    # file = File.join(Rails.root, "cars.csv")
    # file = File.(".\cars.csv")
    CSV.foreach("./films2.csv", headers: true) do |row|
      # p row
      director = Director.find_or_create_by(name: row['Director'])
      genre = Genre.find_or_create_by(name: row['Genre'])
      Movie.create(
        name: row['Film'],
        genre_id: genre.id,
        director_id: director.id
        # model_name: row['model_name'],
        # engine: row['engine'],
        # price: row['price'],
        # doors: row['doors'])
      )
    end
  end
end
