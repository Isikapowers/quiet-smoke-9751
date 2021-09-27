require "rails_helper"

RSpec.describe "Patients Index Page" do
  before :each do
    @grey = Hospital.create!(name: "Grey Sloan Memorial Hospital")

    @meredith = @grey.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Standford University")
    @miranda = @grey.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Standford University")

    @denny = @meredith.patients.create!(name: "Denny Duquette", age: 39)
    @logan = @meredith.patients.create!(name: "Logan Mcgin", age: 15)

    @betty = @miranda.patients.create!(name: "Betty Boo", age: 71)

    visit patients_path
  end

  describe "#Extension" do
    it "displays the names of all patients listed from oldest to youngest" do

      expect(@betty.name).to appear_before(@denny.name)
      expect(@denny.name).to appear_before(@logan.name)
    end
  end
end
