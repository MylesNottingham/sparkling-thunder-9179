require "rails_helper"

RSpec.describe Studio, type: :model do
  describe "relationships" do
    it { should have_many(:movies) }
  end
end
