require "rails_helper"

RSpec.describe "Hopital Show Page" do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)

    visit hospital_path(@grey)
  end

  describe "#User Story 2" do
    it "displays the hospital's name" do

      expect(page).to have_content(@grey.name)
    end

    it "displays the number of doctors that work in this hospital" do

      expect(page).to have_content(2)
    end

    it "displays a unique list of universities that this hospital's doctors attended" do

      expect(page).to have_content("Standford University")
    end
  end
end
