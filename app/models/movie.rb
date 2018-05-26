class Movie < ApplicationRecord
  has_many :movie_actors

  # 足りてない?
  # has_many :actors, through: :movie_actors
end
