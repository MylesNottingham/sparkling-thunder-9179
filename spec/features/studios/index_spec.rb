require "rails_helper"

RSpec.describe "the studios index page" do
  let!(:studio_1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
  let!(:studio_2) { Studio.create!(name: "Disney", location: "Orlando") }

  let!(:movie_1) { studio_1.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action/Adventure") }
  let!(:movie_2) { studio_1.movies.create!(title: "Gremlins", creation_year: 1984, genre: "Horror") }
  let!(:movie_3) { studio_2.movies.create!(title: "Toy Story", creation_year: 1995, genre: "Animation") }
  let!(:movie_4) { studio_2.movies.create!(title: "Avatar", creation_year: 2009, genre: "Science Fiction") }

  before(:each) do
    visit studios_path
  end

  it "displays all Studios and thier associated movies" do
    within("#page-title") do
      expect(page).to have_content("Studios")
    end

    within("#studio-#{studio_1.id}") do
      expect(page).to have_content(studio_1.name)
      expect(page).to have_content("Location: #{studio_1.location}")
      expect(page).to have_content("Movies:")

      within("#movie-#{movie_1.id}") do
        expect(page).to have_content(movie_1.title)
        expect(page).to have_content("Year: #{movie_1.creation_year}")
        expect(page).to have_content("Genre: #{movie_1.genre}")
      end

      within("#movie-#{movie_2.id}") do
        expect(page).to have_content(movie_2.title)
        expect(page).to have_content("Year: #{movie_2.creation_year}")
        expect(page).to have_content("Genre: #{movie_2.genre}")
      end
    end

    within("#studio-#{studio_2.id}") do
      expect(page).to have_content(studio_2.name)
      expect(page).to have_content("Location: #{studio_2.location}")
      expect(page).to have_content("Movies:")

      within("#movie-#{movie_3.id}") do
        expect(page).to have_content(movie_3.title)
        expect(page).to have_content("Year: #{movie_3.creation_year}")
        expect(page).to have_content("Genre: #{movie_3.genre}")
      end

      within("#movie-#{movie_4.id}") do
        expect(page).to have_content(movie_4.title)
        expect(page).to have_content("Year: #{movie_4.creation_year}")
        expect(page).to have_content("Genre: #{movie_4.genre}")
      end
    end
  end
end
