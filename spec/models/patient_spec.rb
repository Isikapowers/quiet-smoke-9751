require "rails_helper"

RSpec.describe Patient do
  describe "relationships" do
    it { should have_many(:appointments) }
    it { should have_many(:doctors).through(:appointments) }
  end
end