require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "relationships" do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe "instance methods" do
    let!(:studio_1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }

    let!(:movie_1) { studio_1.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Action/Adventure") }

    let!(:actor_1) { movie_1.actors.create!(name: "Jeff Goldblum", age: 67) }
    let!(:actor_2) { movie_1.actors.create!(name: "Samuel L. Jackson", age: 71) }
    let!(:actor_3) { movie_1.actors.create!(name: "Laura Dern", age: 53) }
    let!(:actor_4) { movie_1.actors.create!(name: "Richard Attenborough", age: 90) }

    describe "#actors_by_age" do
      it "returns actors ordered by age" do
        expect(movie_1.actors_by_age).to eq([actor_3, actor_1, actor_2, actor_4])
      end
    end

    describe "#average_age_of_actors" do
      it "returns the average age of all actors in the movie" do
        expect(movie_1.average_age_of_actors).to eq(70.25)
      end
    end
  end
end
