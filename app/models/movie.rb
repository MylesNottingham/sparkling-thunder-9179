class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  def actors_by_age
    actors.order(:age)
  end

  def average_age_of_actors
    actors.average(:age)
  end
end
