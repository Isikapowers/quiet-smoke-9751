require "rails_helper"

RSpec.describe "Hopital Show Page" do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @children = Hospital.create!(name: "Children's Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @kodie = @children.doctors.create!(name: "Kodie Kudo", specialty: "Pediatrics", university: "Chicago University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)

    visit hospital_path(@grey)
  end

  describe "#User Story 2" do
    it "displays the hospital's name" do

      expect(page).to have_content(@grey.name)

      expect(page).to have_no_content(@children.name)
    end

    it "displays the number of doctors that work in this hospital" do

      expect(page).to have_content("Number of Doctors: ")
      expect(page).to have_content(2)
    end

    it "displays a unique list of universities that this hospital's doctors attended" do

      expect(page).to have_content("List of Universities")
      expect(page).to have_content("Standford University")

      expect(page).to have_no_content("Chicago University")
    end
  end
end
