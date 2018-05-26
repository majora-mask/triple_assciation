class Actor < ApplicationRecord
  # has_many :attributetype, primary_key: 'name', foreign_key: 'actor_name' ⬅︎nameカラムならこれ？
  has_many :attribute_type
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  # 足りてない?
  # has_many :settings
end
