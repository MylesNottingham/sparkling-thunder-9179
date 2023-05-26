require "rails_helper"

RSpec.describe "the movies show page" do
  let!(:studio_1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }

  let!(:movie_1) { studio_1.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action/Adventure") }

  let!(:actor_1) { movie_1.actors.create!(name: "Jeff Goldblum", age: 67) }
  let!(:actor_2) { movie_1.actors.create!(name: "Samuel L. Jackson", age: 71) }
  let!(:actor_3) { movie_1.actors.create!(name: "Laura Dern", age: 53) }

  before(:each) do
    visit "/movies/#{movie_1.id}"
  end

  it "displays the movie title, creation year, and genre" do
    expect(page).to have_content(movie_1.title)
    expect(page).to have_content("Year: #{movie_1.creation_year}")
    expect(page).to have_content("Genre: #{movie_1.genre}")
  end

  it "displays all of the actors in the movie in order from youngest to oldest" do
    expect(page).to have_content(actor_1.name)
    expect(page).to have_content("Age: #{actor_1.age}")
    expect(page).to have_content(actor_2.name)
    expect(page).to have_content("Age: #{actor_2.age}")
    expect(page).to have_content(actor_3.name)
    expect(page).to have_content("Age: #{actor_3.age}")

    expect(actor_3.name).to appear_before(actor_1.name)
    expect(actor_1.name).to appear_before(actor_2.name)
  end

  it "displays the average age of all of the movie's actors" do
    expect(page).to have_content("Average Age of Actors: 64")
  end
end